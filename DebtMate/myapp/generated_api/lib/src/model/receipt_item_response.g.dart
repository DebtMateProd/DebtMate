// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReceiptItemResponse extends ReceiptItemResponse {
  @override
  final String? item;
  @override
  final double? price;

  factory _$ReceiptItemResponse(
          [void Function(ReceiptItemResponseBuilder)? updates]) =>
      (ReceiptItemResponseBuilder()..update(updates))._build();

  _$ReceiptItemResponse._({this.item, this.price}) : super._();
  @override
  ReceiptItemResponse rebuild(
          void Function(ReceiptItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReceiptItemResponseBuilder toBuilder() =>
      ReceiptItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReceiptItemResponse &&
        item == other.item &&
        price == other.price;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, item.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReceiptItemResponse')
          ..add('item', item)
          ..add('price', price))
        .toString();
  }
}

class ReceiptItemResponseBuilder
    implements Builder<ReceiptItemResponse, ReceiptItemResponseBuilder> {
  _$ReceiptItemResponse? _$v;

  String? _item;
  String? get item => _$this._item;
  set item(String? item) => _$this._item = item;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  ReceiptItemResponseBuilder() {
    ReceiptItemResponse._defaults(this);
  }

  ReceiptItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _item = $v.item;
      _price = $v.price;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReceiptItemResponse other) {
    _$v = other as _$ReceiptItemResponse;
  }

  @override
  void update(void Function(ReceiptItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReceiptItemResponse build() => _build();

  _$ReceiptItemResponse _build() {
    final _$result = _$v ??
        _$ReceiptItemResponse._(
          item: item,
          price: price,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
