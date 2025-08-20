// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_currencies_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAllCurrenciesResponse extends GetAllCurrenciesResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<CurrencyResponse>? currencies;

  factory _$GetAllCurrenciesResponse(
          [void Function(GetAllCurrenciesResponseBuilder)? updates]) =>
      (GetAllCurrenciesResponseBuilder()..update(updates))._build();

  _$GetAllCurrenciesResponse._({this.success, this.message, this.currencies})
      : super._();
  @override
  GetAllCurrenciesResponse rebuild(
          void Function(GetAllCurrenciesResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllCurrenciesResponseBuilder toBuilder() =>
      GetAllCurrenciesResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllCurrenciesResponse &&
        success == other.success &&
        message == other.message &&
        currencies == other.currencies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, currencies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetAllCurrenciesResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('currencies', currencies))
        .toString();
  }
}

class GetAllCurrenciesResponseBuilder
    implements
        Builder<GetAllCurrenciesResponse, GetAllCurrenciesResponseBuilder> {
  _$GetAllCurrenciesResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<CurrencyResponse>? _currencies;
  ListBuilder<CurrencyResponse> get currencies =>
      _$this._currencies ??= ListBuilder<CurrencyResponse>();
  set currencies(ListBuilder<CurrencyResponse>? currencies) =>
      _$this._currencies = currencies;

  GetAllCurrenciesResponseBuilder() {
    GetAllCurrenciesResponse._defaults(this);
  }

  GetAllCurrenciesResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _currencies = $v.currencies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetAllCurrenciesResponse other) {
    _$v = other as _$GetAllCurrenciesResponse;
  }

  @override
  void update(void Function(GetAllCurrenciesResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllCurrenciesResponse build() => _build();

  _$GetAllCurrenciesResponse _build() {
    _$GetAllCurrenciesResponse _$result;
    try {
      _$result = _$v ??
          _$GetAllCurrenciesResponse._(
            success: success,
            message: message,
            currencies: _currencies?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'currencies';
        _currencies?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GetAllCurrenciesResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
