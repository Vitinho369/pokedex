import 'package:dio/dio.dart';
import 'package:pokedex/data/network/entity/http_paged_result.dart';
import 'package:pokedex/data/network/entity/http_paged_result_meet.dart';
import 'package:pokedex/data/network/entity/pokemon_entity.dart';
import 'package:pokedex/domain/exception/network_exception.dart';

class ApiClient {
  late final Dio _dio;

  ApiClient({required String baseUrl}) {
    _dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      );
  }

  Future<List<PokemonEntity>> getPokemons({int? page, int? limit}) async {
    final response = await _dio.get(
      "/pokedex",
      queryParameters: {
        '_page': page,
        '_per_page': limit,
      },
    );
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      final HttpPagedResult receivedData =
          HttpPagedResult.fromJson(response.data as Map<String, dynamic>);

      return receivedData.data;
    } else {
      throw Exception('Unknown error');
    }
  }

  Future<PokemonEntity> getPokemonSorted({int? id}) async {
    final response = await _dio.get(
      "/pokedex/$id",
    );
    if (response.statusCode != null && response.statusCode! >= 400) {
      throw NetworkException(
        statusCode: response.statusCode!,
        message: response.statusMessage,
      );
    } else if (response.statusCode != null) {
      final HttpPagedResultMeet receivedData =
          HttpPagedResultMeet.fromJson(response.data as Map<String, dynamic>);
      return receivedData;
    } else {
      throw Exception('Unknown error');
    }
  }
}
