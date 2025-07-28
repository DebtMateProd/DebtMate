// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_reckoning_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddNewReckoningResponse extends AddNewReckoningResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$AddNewReckoningResponse(
          [void Function(AddNewReckoningResponseBuilder)? updates]) =>
      (AddNewReckoningResponseBuilder()..update(updates))._build();

  _$AddNewReckoningResponse._({this.success, this.message}) : super._();
  @override
  AddNewReckoningResponse rebuild(
          void Function(AddNewReckoningResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNewReckoningResponseBuilder toBuilder() =>
      AddNewReckoningResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNewReckoningResponse &&
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
    return (newBuiltValueToStringHelper(r'AddNewReckoningResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class AddNewReckoningResponseBuilder
    implements
        Builder<AddNewReckoningResponse, AddNewReckoningResponseBuilder> {
  _$AddNewReckoningResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AddNewReckoningResponseBuilder() {
    AddNewReckoningResponse._defaults(this);
  }

  AddNewReckoningResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNewReckoningResponse other) {
    _$v = other as _$AddNewReckoningResponse;
  }

  @override
  void update(void Function(AddNewReckoningResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNewReckoningResponse build() => _build();

  _$AddNewReckoningResponse _build() {
    final _$result = _$v ??
        _$AddNewReckoningResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
