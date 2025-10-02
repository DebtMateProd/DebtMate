// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserResponse extends UpdateUserResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$UpdateUserResponse(
          [void Function(UpdateUserResponseBuilder)? updates]) =>
      (UpdateUserResponseBuilder()..update(updates))._build();

  _$UpdateUserResponse._({this.success, this.message}) : super._();
  @override
  UpdateUserResponse rebuild(
          void Function(UpdateUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserResponseBuilder toBuilder() =>
      UpdateUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserResponse &&
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
    return (newBuiltValueToStringHelper(r'UpdateUserResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class UpdateUserResponseBuilder
    implements Builder<UpdateUserResponse, UpdateUserResponseBuilder> {
  _$UpdateUserResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  UpdateUserResponseBuilder() {
    UpdateUserResponse._defaults(this);
  }

  UpdateUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUserResponse other) {
    _$v = other as _$UpdateUserResponse;
  }

  @override
  void update(void Function(UpdateUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserResponse build() => _build();

  _$UpdateUserResponse _build() {
    final _$result = _$v ??
        _$UpdateUserResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
