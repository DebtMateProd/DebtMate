// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyze_receipt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AnalyzeReceiptResponse extends AnalyzeReceiptResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<ReceiptItemResponse>? items;

  factory _$AnalyzeReceiptResponse(
          [void Function(AnalyzeReceiptResponseBuilder)? updates]) =>
      (AnalyzeReceiptResponseBuilder()..update(updates))._build();

  _$AnalyzeReceiptResponse._({this.success, this.message, this.items})
      : super._();
  @override
  AnalyzeReceiptResponse rebuild(
          void Function(AnalyzeReceiptResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AnalyzeReceiptResponseBuilder toBuilder() =>
      AnalyzeReceiptResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AnalyzeReceiptResponse &&
        success == other.success &&
        message == other.message &&
        items == other.items;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AnalyzeReceiptResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('items', items))
        .toString();
  }
}

class AnalyzeReceiptResponseBuilder
    implements Builder<AnalyzeReceiptResponse, AnalyzeReceiptResponseBuilder> {
  _$AnalyzeReceiptResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<ReceiptItemResponse>? _items;
  ListBuilder<ReceiptItemResponse> get items =>
      _$this._items ??= ListBuilder<ReceiptItemResponse>();
  set items(ListBuilder<ReceiptItemResponse>? items) => _$this._items = items;

  AnalyzeReceiptResponseBuilder() {
    AnalyzeReceiptResponse._defaults(this);
  }

  AnalyzeReceiptResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AnalyzeReceiptResponse other) {
    _$v = other as _$AnalyzeReceiptResponse;
  }

  @override
  void update(void Function(AnalyzeReceiptResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AnalyzeReceiptResponse build() => _build();

  _$AnalyzeReceiptResponse _build() {
    _$AnalyzeReceiptResponse _$result;
    try {
      _$result = _$v ??
          _$AnalyzeReceiptResponse._(
            success: success,
            message: message,
            items: _items?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AnalyzeReceiptResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
