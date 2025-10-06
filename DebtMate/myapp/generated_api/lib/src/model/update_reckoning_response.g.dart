// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reckoning_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateReckoningResponse extends UpdateReckoningResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$UpdateReckoningResponse(
          [void Function(UpdateReckoningResponseBuilder)? updates]) =>
      (UpdateReckoningResponseBuilder()..update(updates))._build();

  _$UpdateReckoningResponse._({this.success, this.message}) : super._();
  @override
  UpdateReckoningResponse rebuild(
          void Function(UpdateReckoningResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateReckoningResponseBuilder toBuilder() =>
      UpdateReckoningResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateReckoningResponse &&
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
    return (newBuiltValueToStringHelper(r'UpdateReckoningResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class UpdateReckoningResponseBuilder
    implements
        Builder<UpdateReckoningResponse, UpdateReckoningResponseBuilder> {
  _$UpdateReckoningResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UpdateReckoningResponseBuilder() {
    UpdateReckoningResponse._defaults(this);
  }

  UpdateReckoningResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateReckoningResponse other) {
    _$v = other as _$UpdateReckoningResponse;
  }

  @override
  void update(void Function(UpdateReckoningResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateReckoningResponse build() => _build();

  _$UpdateReckoningResponse _build() {
    final _$result = _$v ??
        _$UpdateReckoningResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
