// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_trainer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonTrainer {
  List<Pokemon>? get pokemons => throw _privateConstructorUsedError;

  /// Create a copy of PokemonTrainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonTrainerCopyWith<PokemonTrainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonTrainerCopyWith<$Res> {
  factory $PokemonTrainerCopyWith(
          PokemonTrainer value, $Res Function(PokemonTrainer) then) =
      _$PokemonTrainerCopyWithImpl<$Res, PokemonTrainer>;
  @useResult
  $Res call({List<Pokemon>? pokemons});
}

/// @nodoc
class _$PokemonTrainerCopyWithImpl<$Res, $Val extends PokemonTrainer>
    implements $PokemonTrainerCopyWith<$Res> {
  _$PokemonTrainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonTrainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = freezed,
  }) {
    return _then(_value.copyWith(
      pokemons: freezed == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonTrainerImplCopyWith<$Res>
    implements $PokemonTrainerCopyWith<$Res> {
  factory _$$PokemonTrainerImplCopyWith(_$PokemonTrainerImpl value,
          $Res Function(_$PokemonTrainerImpl) then) =
      __$$PokemonTrainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon>? pokemons});
}

/// @nodoc
class __$$PokemonTrainerImplCopyWithImpl<$Res>
    extends _$PokemonTrainerCopyWithImpl<$Res, _$PokemonTrainerImpl>
    implements _$$PokemonTrainerImplCopyWith<$Res> {
  __$$PokemonTrainerImplCopyWithImpl(
      _$PokemonTrainerImpl _value, $Res Function(_$PokemonTrainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonTrainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = freezed,
  }) {
    return _then(_$PokemonTrainerImpl(
      pokemons: freezed == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
    ));
  }
}

/// @nodoc

class _$PokemonTrainerImpl implements _PokemonTrainer {
  const _$PokemonTrainerImpl({required final List<Pokemon>? pokemons})
      : _pokemons = pokemons;

  final List<Pokemon>? _pokemons;
  @override
  List<Pokemon>? get pokemons {
    final value = _pokemons;
    if (value == null) return null;
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PokemonTrainer(pokemons: $pokemons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonTrainerImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_pokemons));

  /// Create a copy of PokemonTrainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonTrainerImplCopyWith<_$PokemonTrainerImpl> get copyWith =>
      __$$PokemonTrainerImplCopyWithImpl<_$PokemonTrainerImpl>(
          this, _$identity);
}

abstract class _PokemonTrainer implements PokemonTrainer {
  const factory _PokemonTrainer({required final List<Pokemon>? pokemons}) =
      _$PokemonTrainerImpl;

  @override
  List<Pokemon>? get pokemons;

  /// Create a copy of PokemonTrainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonTrainerImplCopyWith<_$PokemonTrainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
