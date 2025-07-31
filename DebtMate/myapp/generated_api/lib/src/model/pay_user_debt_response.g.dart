// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_user_debt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PayUserDebtResponse extends PayUserDebtResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$PayUserDebtResponse(
          [void Function(PayUserDebtResponseBuilder)? updates]) =>
      (PayUserDebtResponseBuilder()..update(updates))._build();

  _$PayUserDebtResponse._({this.success, this.message}) : super._();
  @override
  PayUserDebtResponse rebuild(
          void Function(PayUserDebtResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayUserDebtResponseBuilder toBuilder() =>
      PayUserDebtResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayUserDebtResponse &&
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
    return (newBuiltValueToStringHelper(r'PayUserDebtResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class PayUserDebtResponseBuilder
    implements Builder<PayUserDebtResponse, PayUserDebtResponseBuilder> {
  _$PayUserDebtResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PayUserDebtResponseBuilder() {
    PayUserDebtResponse._defaults(this);
  }

  PayUserDebtResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayUserDebtResponse other) {
    _$v = other as _$PayUserDebtResponse;
  }

  @override
  void update(void Function(PayUserDebtResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PayUserDebtResponse build() => _build();

  _$PayUserDebtResponse _build() {
    final _$result = _$v ??
        _$PayUserDebtResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
