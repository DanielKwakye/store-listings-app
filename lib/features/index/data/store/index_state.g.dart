// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IndexStateCWProxy {
  IndexState status(BlocStatus status);

  IndexState message(String message);

  IndexState menuOption(IndexMenuOption menuOption);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IndexState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IndexState(...).copyWith(id: 12, name: "My name")
  /// ````
  IndexState call({
    BlocStatus? status,
    String? message,
    IndexMenuOption? menuOption,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIndexState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIndexState.copyWith.fieldName(...)`
class _$IndexStateCWProxyImpl implements _$IndexStateCWProxy {
  const _$IndexStateCWProxyImpl(this._value);

  final IndexState _value;

  @override
  IndexState status(BlocStatus status) => this(status: status);

  @override
  IndexState message(String message) => this(message: message);

  @override
  IndexState menuOption(IndexMenuOption menuOption) =>
      this(menuOption: menuOption);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IndexState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IndexState(...).copyWith(id: 12, name: "My name")
  /// ````
  IndexState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? menuOption = const $CopyWithPlaceholder(),
  }) {
    return IndexState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BlocStatus,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
      menuOption:
          menuOption == const $CopyWithPlaceholder() || menuOption == null
              ? _value.menuOption
              // ignore: cast_nullable_to_non_nullable
              : menuOption as IndexMenuOption,
    );
  }
}

extension $IndexStateCopyWith on IndexState {
  /// Returns a callable class that can be used as follows: `instanceOfIndexState.copyWith(...)` or like so:`instanceOfIndexState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IndexStateCWProxy get copyWith => _$IndexStateCWProxyImpl(this);
}
