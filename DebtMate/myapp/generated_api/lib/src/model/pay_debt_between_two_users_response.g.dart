// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_debt_between_two_users_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PayDebtBetweenTwoUsersResponse extends PayDebtBetweenTwoUsersResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$PayDebtBetweenTwoUsersResponse(
          [void Function(PayDebtBetweenTwoUsersResponseBuilder)? updates]) =>
      (PayDebtBetweenTwoUsersResponseBuilder()..update(updates))._build();

  _$PayDebtBetweenTwoUsersResponse._({this.success, this.message}) : super._();
  @override
  PayDebtBetweenTwoUsersResponse rebuild(
          void Function(PayDebtBetweenTwoUsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayDebtBetweenTwoUsersResponseBuilder toBuilder() =>
      PayDebtBetweenTwoUsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayDebtBetweenTwoUsersResponse &&
        success == other.success &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PayDebtBetweenTwoUsersResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class PayDebtBetweenTwoUsersResponseBuilder
    implements
        Builder<PayDebtBetweenTwoUsersResponse,
            PayDebtBetweenTwoUsersResponseBuilder> {
  _$PayDebtBetweenTwoUsersResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PayDebtBetweenTwoUsersResponseBuilder() {
    PayDebtBetweenTwoUsersResponse._defaults(this);
  }

  PayDebtBetweenTwoUsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayDebtBetweenTwoUsersResponse other) {
    _$v = other as _$PayDebtBetweenTwoUsersResponse;
  }

  @override
  void update(void Function(PayDebtBetweenTwoUsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PayDebtBetweenTwoUsersResponse build() => _build();

  _$PayDebtBetweenTwoUsersResponse _build() {
    final _$result = _$v ??
        _$PayDebtBetweenTwoUsersResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
