// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_pending_friend_list_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUserPendingFriendListResponse
    extends GetUserPendingFriendListResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<UserResponse>? users;

  factory _$GetUserPendingFriendListResponse(
          [void Function(GetUserPendingFriendListResponseBuilder)? updates]) =>
      (GetUserPendingFriendListResponseBuilder()..update(updates))._build();

  _$GetUserPendingFriendListResponse._({this.success, this.message, this.users})
      : super._();
  @override
  GetUserPendingFriendListResponse rebuild(
          void Function(GetUserPendingFriendListResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserPendingFriendListResponseBuilder toBuilder() =>
      GetUserPendingFriendListResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserPendingFriendListResponse &&
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
    return (newBuiltValueToStringHelper(r'GetUserPendingFriendListResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('users', users))
        .toString();
  }
}

class GetUserPendingFriendListResponseBuilder
    implements
        Builder<GetUserPendingFriendListResponse,
            GetUserPendingFriendListResponseBuilder> {
  _$GetUserPendingFriendListResponse? _$v;

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

  GetUserPendingFriendListResponseBuilder() {
    GetUserPendingFriendListResponse._defaults(this);
  }

  GetUserPendingFriendListResponseBuilder get _$this {
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
  void replace(GetUserPendingFriendListResponse other) {
    _$v = other as _$GetUserPendingFriendListResponse;
  }

  @override
  void update(void Function(GetUserPendingFriendListResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUserPendingFriendListResponse build() => _build();

  _$GetUserPendingFriendListResponse _build() {
    _$GetUserPendingFriendListResponse _$result;
    try {
      _$result = _$v ??
          _$GetUserPendingFriendListResponse._(
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
            r'GetUserPendingFriendListResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
