// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BalanceUserResponse extends BalanceUserResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<BalanceUser>? balanceUsers;

  factory _$BalanceUserResponse(
          [void Function(BalanceUserResponseBuilder)? updates]) =>
      (BalanceUserResponseBuilder()..update(updates))._build();

  _$BalanceUserResponse._({this.success, this.message, this.balanceUsers})
      : super._();
  @override
  BalanceUserResponse rebuild(
          void Function(BalanceUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BalanceUserResponseBuilder toBuilder() =>
      BalanceUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BalanceUserResponse &&
        success == other.success &&
        message == other.message &&
        balanceUsers == other.balanceUsers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, balanceUsers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BalanceUserResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('balanceUsers', balanceUsers))
        .toString();
  }
}

class BalanceUserResponseBuilder
    implements Builder<BalanceUserResponse, BalanceUserResponseBuilder> {
  _$BalanceUserResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<BalanceUser>? _balanceUsers;
  ListBuilder<BalanceUser> get balanceUsers =>
      _$this._balanceUsers ??= ListBuilder<BalanceUser>();
  set balanceUsers(ListBuilder<BalanceUser>? balanceUsers) =>
      _$this._balanceUsers = balanceUsers;

  BalanceUserResponseBuilder() {
    BalanceUserResponse._defaults(this);
  }

  BalanceUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _balanceUsers = $v.balanceUsers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BalanceUserResponse other) {
    _$v = other as _$BalanceUserResponse;
  }

  @override
  void update(void Function(BalanceUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BalanceUserResponse build() => _build();

  _$BalanceUserResponse _build() {
    _$BalanceUserResponse _$result;
    try {
      _$result = _$v ??
          _$BalanceUserResponse._(
            success: success,
            message: message,
            balanceUsers: _balanceUsers?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'balanceUsers';
        _balanceUsers?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BalanceUserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
