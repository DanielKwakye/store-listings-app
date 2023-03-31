// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KYCStateCWProxy {
  KYCState status(BlocStatus status);

  KYCState message(String message);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KYCState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KYCState(...).copyWith(id: 12, name: "My name")
  /// ````
  KYCState call({
    BlocStatus? status,
    String? message,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKYCState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKYCState.copyWith.fieldName(...)`
class _$KYCStateCWProxyImpl implements _$KYCStateCWProxy {
  const _$KYCStateCWProxyImpl(this._value);

  final KYCState _value;

  @override
  KYCState status(BlocStatus status) => this(status: status);

  @override
  KYCState message(String message) => this(message: message);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `KYCState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// KYCState(...).copyWith(id: 12, name: "My name")
  /// ````
  KYCState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
  }) {
    return KYCState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as BlocStatus,
      message: message == const $CopyWithPlaceholder() || message == null
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String,
    );
  }
}

extension $KYCStateCopyWith on KYCState {
  /// Returns a callable class that can be used as follows: `instanceOfKYCState.copyWith(...)` or like so:`instanceOfKYCState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KYCStateCWProxy get copyWith => _$KYCStateCWProxyImpl(this);
}
