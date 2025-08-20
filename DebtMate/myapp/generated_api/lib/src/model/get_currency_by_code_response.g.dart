// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currency_by_code_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetCurrencyByCodeResponse extends GetCurrencyByCodeResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final CurrencyResponse? currency;

  factory _$GetCurrencyByCodeResponse(
          [void Function(GetCurrencyByCodeResponseBuilder)? updates]) =>
      (GetCurrencyByCodeResponseBuilder()..update(updates))._build();

  _$GetCurrencyByCodeResponse._({this.success, this.message, this.currency})
      : super._();
  @override
  GetCurrencyByCodeResponse rebuild(
          void Function(GetCurrencyByCodeResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetCurrencyByCodeResponseBuilder toBuilder() =>
      GetCurrencyByCodeResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetCurrencyByCodeResponse &&
        success == other.success &&
        message == other.message &&
        currency == other.currency;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, currency.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetCurrencyByCodeResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('currency', currency))
        .toString();
  }
}

class GetCurrencyByCodeResponseBuilder
    implements
        Builder<GetCurrencyByCodeResponse, GetCurrencyByCodeResponseBuilder> {
  _$GetCurrencyByCodeResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  CurrencyResponseBuilder? _currency;
  CurrencyResponseBuilder get currency =>
      _$this._currency ??= CurrencyResponseBuilder();
  set currency(CurrencyResponseBuilder? currency) =>
      _$this._currency = currency;

  GetCurrencyByCodeResponseBuilder() {
    GetCurrencyByCodeResponse._defaults(this);
  }

  GetCurrencyByCodeResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _currency = $v.currency?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetCurrencyByCodeResponse other) {
    _$v = other as _$GetCurrencyByCodeResponse;
  }

  @override
  void update(void Function(GetCurrencyByCodeResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetCurrencyByCodeResponse build() => _build();

  _$GetCurrencyByCodeResponse _build() {
    _$GetCurrencyByCodeResponse _$result;
    try {
      _$result = _$v ??
          _$GetCurrencyByCodeResponse._(
            success: success,
            message: message,
            currency: _currency?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currency';
        _currency?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GetCurrencyByCodeResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
