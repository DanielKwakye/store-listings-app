// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AccountStateCWProxy {
  AccountState status(BlocStatus status);

  AccountState message(String message);

  AccountState menuOption(AccountMenuOption menuOption);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    BlocStatus? status,
    String? message,
    AccountMenuOption? menuOption,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAccountState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAccountState.copyWith.fieldName(...)`
class _$AccountStateCWProxyImpl implements _$AccountStateCWProxy {
  const _$AccountStateCWProxyImpl(this._value);

  final AccountState _value;

  @override
  AccountState status(BlocStatus status) => this(status: status);

  @override
  AccountState message(String message) => this(message: message);

  @override
  AccountState menuOption(AccountMenuOption menuOption) =>
      this(menuOption: menuOption);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AccountState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AccountState(...).copyWith(id: 12, name: "My name")
  /// ````
  AccountState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? menuOption = const $CopyWithPlaceholder(),
  }) {
    return AccountState(
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
              : menuOption as AccountMenuOption,
    );
  }
}

extension $AccountStateCopyWith on AccountState {
  /// Returns a callable class that can be used as follows: `instanceOfAccountState.copyWith(...)` or like so:`instanceOfAccountState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AccountStateCWProxy get copyWith => _$AccountStateCWProxyImpl(this);
}
