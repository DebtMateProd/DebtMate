// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remove_friendship_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RemoveFriendshipRequest extends RemoveFriendshipRequest {
  @override
  final String user1Id;
  @override
  final String user2Id;

  factory _$RemoveFriendshipRequest(
          [void Function(RemoveFriendshipRequestBuilder)? updates]) =>
      (RemoveFriendshipRequestBuilder()..update(updates))._build();

  _$RemoveFriendshipRequest._({required this.user1Id, required this.user2Id})
      : super._();
  @override
  RemoveFriendshipRequest rebuild(
          void Function(RemoveFriendshipRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RemoveFriendshipRequestBuilder toBuilder() =>
      RemoveFriendshipRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RemoveFriendshipRequest &&
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
    return (newBuiltValueToStringHelper(r'RemoveFriendshipRequest')
          ..add('user1Id', user1Id)
          ..add('user2Id', user2Id))
        .toString();
  }
}

class RemoveFriendshipRequestBuilder
    implements
        Builder<RemoveFriendshipRequest, RemoveFriendshipRequestBuilder> {
  _$RemoveFriendshipRequest? _$v;

  String? _user1Id;
  String? get user1Id => _$this._user1Id;
  set user1Id(String? user1Id) => _$this._user1Id = user1Id;

  String? _user2Id;
  String? get user2Id => _$this._user2Id;
  set user2Id(String? user2Id) => _$this._user2Id = user2Id;

  RemoveFriendshipRequestBuilder() {
    RemoveFriendshipRequest._defaults(this);
  }

  RemoveFriendshipRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1Id = $v.user1Id;
      _user2Id = $v.user2Id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RemoveFriendshipRequest other) {
    _$v = other as _$RemoveFriendshipRequest;
  }

  @override
  void update(void Function(RemoveFriendshipRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RemoveFriendshipRequest build() => _build();

  _$RemoveFriendshipRequest _build() {
    final _$result = _$v ??
        _$RemoveFriendshipRequest._(
          user1Id: BuiltValueNullFieldError.checkNotNull(
              user1Id, r'RemoveFriendshipRequest', 'user1Id'),
          user2Id: BuiltValueNullFieldError.checkNotNull(
              user2Id, r'RemoveFriendshipRequest', 'user2Id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
