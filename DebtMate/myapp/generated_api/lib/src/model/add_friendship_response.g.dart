// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_friendship_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddFriendshipResponse extends AddFriendshipResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$AddFriendshipResponse(
          [void Function(AddFriendshipResponseBuilder)? updates]) =>
      (AddFriendshipResponseBuilder()..update(updates))._build();

  _$AddFriendshipResponse._({this.success, this.message}) : super._();
  @override
  AddFriendshipResponse rebuild(
          void Function(AddFriendshipResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFriendshipResponseBuilder toBuilder() =>
      AddFriendshipResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFriendshipResponse &&
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
    return (newBuiltValueToStringHelper(r'AddFriendshipResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class AddFriendshipResponseBuilder
    implements Builder<AddFriendshipResponse, AddFriendshipResponseBuilder> {
  _$AddFriendshipResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  AddFriendshipResponseBuilder() {
    AddFriendshipResponse._defaults(this);
  }

  AddFriendshipResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFriendshipResponse other) {
    _$v = other as _$AddFriendshipResponse;
  }

  @override
  void update(void Function(AddFriendshipResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFriendshipResponse build() => _build();

  _$AddFriendshipResponse _build() {
    final _$result = _$v ??
        _$AddFriendshipResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
