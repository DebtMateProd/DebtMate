// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_friend_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUserFriendListResponse extends GetUserFriendListResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<UserResponse>? users;

  factory _$GetUserFriendListResponse(
          [void Function(GetUserFriendListResponseBuilder)? updates]) =>
      (GetUserFriendListResponseBuilder()..update(updates))._build();

  _$GetUserFriendListResponse._({this.success, this.message, this.users})
      : super._();
  @override
  GetUserFriendListResponse rebuild(
          void Function(GetUserFriendListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserFriendListResponseBuilder toBuilder() =>
      GetUserFriendListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserFriendListResponse &&
        success == other.success &&
        message == other.message &&
        users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUserFriendListResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('users', users))
        .toString();
  }
}

class GetUserFriendListResponseBuilder
    implements
        Builder<GetUserFriendListResponse, GetUserFriendListResponseBuilder> {
  _$GetUserFriendListResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<UserResponse>? _users;
  ListBuilder<UserResponse> get users =>
      _$this._users ??= ListBuilder<UserResponse>();
  set users(ListBuilder<UserResponse>? users) => _$this._users = users;

  GetUserFriendListResponseBuilder() {
    GetUserFriendListResponse._defaults(this);
  }

  GetUserFriendListResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUserFriendListResponse other) {
    _$v = other as _$GetUserFriendListResponse;
  }

  @override
  void update(void Function(GetUserFriendListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUserFriendListResponse build() => _build();

  _$GetUserFriendListResponse _build() {
    _$GetUserFriendListResponse _$result;
    try {
      _$result = _$v ??
          _$GetUserFriendListResponse._(
            success: success,
            message: message,
            users: _users?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GetUserFriendListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
