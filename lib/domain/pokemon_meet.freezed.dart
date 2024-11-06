// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_meet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonMeet {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get type => throw _privateConstructorUsedError;
  Base? get base => throw _privateConstructorUsedError;
  String? get imgThumbnailUrl => throw _privateConstructorUsedError;
  String? get imgSpriteUrl => throw _privateConstructorUsedError;
  String? get dataGenerated => throw _privateConstructorUsedError;

  /// Create a copy of PokemonMeet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonMeetCopyWith<PokemonMeet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonMeetCopyWith<$Res> {
  factory $PokemonMeetCopyWith(
          PokemonMeet value, $Res Function(PokemonMeet) then) =
      _$PokemonMeetCopyWithImpl<$Res, PokemonMeet>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      List<String>? type,
      Base? base,
      String? imgThumbnailUrl,
      String? imgSpriteUrl,
      String? dataGenerated});
}

/// @nodoc
class _$PokemonMeetCopyWithImpl<$Res, $Val extends PokemonMeet>
    implements $PokemonMeetCopyWith<$Res> {
  _$PokemonMeetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonMeet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? base = freezed,
    Object? imgThumbnailUrl = freezed,
    Object? imgSpriteUrl = freezed,
    Object? dataGenerated = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Base?,
      imgThumbnailUrl: freezed == imgThumbnailUrl
          ? _value.imgThumbnailUrl
          : imgThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSpriteUrl: freezed == imgSpriteUrl
          ? _value.imgSpriteUrl
          : imgSpriteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dataGenerated: freezed == dataGenerated
          ? _value.dataGenerated
          : dataGenerated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonMeetImplCopyWith<$Res>
    implements $PokemonMeetCopyWith<$Res> {
  factory _$$PokemonMeetImplCopyWith(
          _$PokemonMeetImpl value, $Res Function(_$PokemonMeetImpl) then) =
      __$$PokemonMeetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      List<String>? type,
      Base? base,
      String? imgThumbnailUrl,
      String? imgSpriteUrl,
      String? dataGenerated});
}

/// @nodoc
class __$$PokemonMeetImplCopyWithImpl<$Res>
    extends _$PokemonMeetCopyWithImpl<$Res, _$PokemonMeetImpl>
    implements _$$PokemonMeetImplCopyWith<$Res> {
  __$$PokemonMeetImplCopyWithImpl(
      _$PokemonMeetImpl _value, $Res Function(_$PokemonMeetImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonMeet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? base = freezed,
    Object? imgThumbnailUrl = freezed,
    Object? imgSpriteUrl = freezed,
    Object? dataGenerated = freezed,
  }) {
    return _then(_$PokemonMeetImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value._type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as Base?,
      imgThumbnailUrl: freezed == imgThumbnailUrl
          ? _value.imgThumbnailUrl
          : imgThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSpriteUrl: freezed == imgSpriteUrl
          ? _value.imgSpriteUrl
          : imgSpriteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dataGenerated: freezed == dataGenerated
          ? _value.dataGenerated
          : dataGenerated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PokemonMeetImpl implements _PokemonMeet {
  const _$PokemonMeetImpl(
      {required this.id,
      required this.name,
      final List<String>? type,
      this.base,
      this.imgThumbnailUrl,
      this.imgSpriteUrl,
      this.dataGenerated})
      : _type = type;

  @override
  final int? id;
  @override
  final String? name;
  final List<String>? _type;
  @override
  List<String>? get type {
    final value = _type;
    if (value == null) return null;
    if (_type is EqualUnmodifiableListView) return _type;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Base? base;
  @override
  final String? imgThumbnailUrl;
  @override
  final String? imgSpriteUrl;
  @override
  final String? dataGenerated;

  @override
  String toString() {
    return 'PokemonMeet(id: $id, name: $name, type: $type, base: $base, imgThumbnailUrl: $imgThumbnailUrl, imgSpriteUrl: $imgSpriteUrl, dataGenerated: $dataGenerated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonMeetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._type, _type) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.imgThumbnailUrl, imgThumbnailUrl) ||
                other.imgThumbnailUrl == imgThumbnailUrl) &&
            (identical(other.imgSpriteUrl, imgSpriteUrl) ||
                other.imgSpriteUrl == imgSpriteUrl) &&
            (identical(other.dataGenerated, dataGenerated) ||
                other.dataGenerated == dataGenerated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_type),
      base,
      imgThumbnailUrl,
      imgSpriteUrl,
      dataGenerated);

  /// Create a copy of PokemonMeet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonMeetImplCopyWith<_$PokemonMeetImpl> get copyWith =>
      __$$PokemonMeetImplCopyWithImpl<_$PokemonMeetImpl>(this, _$identity);
}

abstract class _PokemonMeet implements PokemonMeet {
  const factory _PokemonMeet(
      {required final int? id,
      required final String? name,
      final List<String>? type,
      final Base? base,
      final String? imgThumbnailUrl,
      final String? imgSpriteUrl,
      final String? dataGenerated}) = _$PokemonMeetImpl;

  @override
  int? get id;
  @override
  String? get name;
  @override
  List<String>? get type;
  @override
  Base? get base;
  @override
  String? get imgThumbnailUrl;
  @override
  String? get imgSpriteUrl;
  @override
  String? get dataGenerated;

  /// Create a copy of PokemonMeet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonMeetImplCopyWith<_$PokemonMeetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
