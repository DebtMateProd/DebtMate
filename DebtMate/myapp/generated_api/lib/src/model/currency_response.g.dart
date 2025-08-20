// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CurrencyResponse extends CurrencyResponse {
  @override
  final String? code;
  @override
  final String? symbol;
  @override
  final String? name;

  factory _$CurrencyResponse(
          [void Function(CurrencyResponseBuilder)? updates]) =>
      (CurrencyResponseBuilder()..update(updates))._build();

  _$CurrencyResponse._({this.code, this.symbol, this.name}) : super._();
  @override
  CurrencyResponse rebuild(void Function(CurrencyResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CurrencyResponseBuilder toBuilder() =>
      CurrencyResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CurrencyResponse &&
        code == other.code &&
        symbol == other.symbol &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, symbol.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CurrencyResponse')
          ..add('code', code)
          ..add('symbol', symbol)
          ..add('name', name))
        .toString();
  }
}

class CurrencyResponseBuilder
    implements Builder<CurrencyResponse, CurrencyResponseBuilder> {
  _$CurrencyResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _symbol;
  String? get symbol => _$this._symbol;
  set symbol(String? symbol) => _$this._symbol = symbol;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CurrencyResponseBuilder() {
    CurrencyResponse._defaults(this);
  }

  CurrencyResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _symbol = $v.symbol;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CurrencyResponse other) {
    _$v = other as _$CurrencyResponse;
  }

  @override
  void update(void Function(CurrencyResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CurrencyResponse build() => _build();

  _$CurrencyResponse _build() {
    final _$result = _$v ??
        _$CurrencyResponse._(
          code: code,
          symbol: symbol,
          name: name,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
