// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetAllResponse extends GetAllResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<UserResponse>? users;

  factory _$GetAllResponse([void Function(GetAllResponseBuilder)? updates]) =>
      (GetAllResponseBuilder()..update(updates))._build();

  _$GetAllResponse._({this.success, this.message, this.users}) : super._();
  @override
  GetAllResponse rebuild(void Function(GetAllResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetAllResponseBuilder toBuilder() => GetAllResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetAllResponse &&
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
    return (newBuiltValueToStringHelper(r'GetAllResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('users', users))
        .toString();
  }
}

class GetAllResponseBuilder
    implements Builder<GetAllResponse, GetAllResponseBuilder> {
  _$GetAllResponse? _$v;

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

  GetAllResponseBuilder() {
    GetAllResponse._defaults(this);
  }

  GetAllResponseBuilder get _$this {
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
  void replace(GetAllResponse other) {
    _$v = other as _$GetAllResponse;
  }

  @override
  void update(void Function(GetAllResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetAllResponse build() => _build();

  _$GetAllResponse _build() {
    _$GetAllResponse _$result;
    try {
      _$result = _$v ??
          _$GetAllResponse._(
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
            r'GetAllResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
