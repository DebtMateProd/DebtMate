// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_friendship_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AcceptFriendshipRequest extends AcceptFriendshipRequest {
  @override
  final String user1Id;
  @override
  final String user2Id;

  factory _$AcceptFriendshipRequest(
          [void Function(AcceptFriendshipRequestBuilder)? updates]) =>
      (AcceptFriendshipRequestBuilder()..update(updates))._build();

  _$AcceptFriendshipRequest._({required this.user1Id, required this.user2Id})
      : super._();
  @override
  AcceptFriendshipRequest rebuild(
          void Function(AcceptFriendshipRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptFriendshipRequestBuilder toBuilder() =>
      AcceptFriendshipRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptFriendshipRequest &&
        user1Id == other.user1Id &&
        user2Id == other.user2Id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user1Id.hashCode);
    _$hash = $jc(_$hash, user2Id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptFriendshipRequest')
          ..add('user1Id', user1Id)
          ..add('user2Id', user2Id))
        .toString();
  }
}

class AcceptFriendshipRequestBuilder
    implements
        Builder<AcceptFriendshipRequest, AcceptFriendshipRequestBuilder> {
  _$AcceptFriendshipRequest? _$v;

  String? _user1Id;
  String? get user1Id => _$this._user1Id;
  set user1Id(String? user1Id) => _$this._user1Id = user1Id;

  String? _user2Id;
  String? get user2Id => _$this._user2Id;
  set user2Id(String? user2Id) => _$this._user2Id = user2Id;

  AcceptFriendshipRequestBuilder() {
    AcceptFriendshipRequest._defaults(this);
  }

  AcceptFriendshipRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1Id = $v.user1Id;
      _user2Id = $v.user2Id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptFriendshipRequest other) {
    _$v = other as _$AcceptFriendshipRequest;
  }

  @override
  void update(void Function(AcceptFriendshipRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptFriendshipRequest build() => _build();

  _$AcceptFriendshipRequest _build() {
    final _$result = _$v ??
        _$AcceptFriendshipRequest._(
          user1Id: BuiltValueNullFieldError.checkNotNull(
              user1Id, r'AcceptFriendshipRequest', 'user1Id'),
          user2Id: BuiltValueNullFieldError.checkNotNull(
              user2Id, r'AcceptFriendshipRequest', 'user2Id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
