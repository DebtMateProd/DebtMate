// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_friendship_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoveFriendshipResponse extends RemoveFriendshipResponse {
  @override
  final bool? success;
  @override
  final String? message;

  factory _$RemoveFriendshipResponse(
          [void Function(RemoveFriendshipResponseBuilder)? updates]) =>
      (RemoveFriendshipResponseBuilder()..update(updates))._build();

  _$RemoveFriendshipResponse._({this.success, this.message}) : super._();
  @override
  RemoveFriendshipResponse rebuild(
          void Function(RemoveFriendshipResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveFriendshipResponseBuilder toBuilder() =>
      RemoveFriendshipResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveFriendshipResponse &&
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
    return (newBuiltValueToStringHelper(r'RemoveFriendshipResponse')
          ..add('success', success)
          ..add('message', message))
        .toString();
  }
}

class RemoveFriendshipResponseBuilder
    implements
        Builder<RemoveFriendshipResponse, RemoveFriendshipResponseBuilder> {
  _$RemoveFriendshipResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RemoveFriendshipResponseBuilder() {
    RemoveFriendshipResponse._defaults(this);
  }

  RemoveFriendshipResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveFriendshipResponse other) {
    _$v = other as _$RemoveFriendshipResponse;
  }

  @override
  void update(void Function(RemoveFriendshipResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveFriendshipResponse build() => _build();

  _$RemoveFriendshipResponse _build() {
    final _$result = _$v ??
        _$RemoveFriendshipResponse._(
          success: success,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
