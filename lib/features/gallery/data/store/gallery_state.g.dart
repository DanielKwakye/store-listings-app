// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GalleryStateCWProxy {
  GalleryState status(BlocStatus status);

  GalleryState message(String message);

  GalleryState animals(List<AnimalModel> animals);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GalleryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GalleryState(...).copyWith(id: 12, name: "My name")
  /// ````
  GalleryState call({
    BlocStatus? status,
    String? message,
    List<AnimalModel>? animals,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGalleryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGalleryState.copyWith.fieldName(...)`
class _$GalleryStateCWProxyImpl implements _$GalleryStateCWProxy {
  const _$GalleryStateCWProxyImpl(this._value);

  final GalleryState _value;

  @override
  GalleryState status(BlocStatus status) => this(status: status);

  @override
  GalleryState message(String message) => this(message: message);

  @override
  GalleryState animals(List<AnimalModel> animals) => this(animals: animals);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GalleryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GalleryState(...).copyWith(id: 12, name: "My name")
  /// ````
  GalleryState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? animals = const $CopyWithPlaceholder(),
  }) {
    return GalleryState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BlocStatus,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      animals: animals == const $CopyWithPlaceholder() || animals == null
          ? _value.animals
          // ignore: cast_nullable_to_non_nullable
          : animals as List<AnimalModel>,
    );
  }
}

extension $GalleryStateCopyWith on GalleryState {
  /// Returns a callable class that can be used as follows: `instanceOfGalleryState.copyWith(...)` or like so:`instanceOfGalleryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GalleryStateCWProxy get copyWith => _$GalleryStateCWProxyImpl(this);
}
