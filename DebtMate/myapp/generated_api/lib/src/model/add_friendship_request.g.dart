// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_friendship_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddFriendshipRequest extends AddFriendshipRequest {
  @override
  final String user1Id;
  @override
  final String user2Id;

  factory _$AddFriendshipRequest(
          [void Function(AddFriendshipRequestBuilder)? updates]) =>
      (AddFriendshipRequestBuilder()..update(updates))._build();

  _$AddFriendshipRequest._({required this.user1Id, required this.user2Id})
      : super._();
  @override
  AddFriendshipRequest rebuild(
          void Function(AddFriendshipRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddFriendshipRequestBuilder toBuilder() =>
      AddFriendshipRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddFriendshipRequest &&
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
    return (newBuiltValueToStringHelper(r'AddFriendshipRequest')
          ..add('user1Id', user1Id)
          ..add('user2Id', user2Id))
        .toString();
  }
}

class AddFriendshipRequestBuilder
    implements Builder<AddFriendshipRequest, AddFriendshipRequestBuilder> {
  _$AddFriendshipRequest? _$v;

  String? _user1Id;
  String? get user1Id => _$this._user1Id;
  set user1Id(String? user1Id) => _$this._user1Id = user1Id;

  String? _user2Id;
  String? get user2Id => _$this._user2Id;
  set user2Id(String? user2Id) => _$this._user2Id = user2Id;

  AddFriendshipRequestBuilder() {
    AddFriendshipRequest._defaults(this);
  }

  AddFriendshipRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1Id = $v.user1Id;
      _user2Id = $v.user2Id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddFriendshipRequest other) {
    _$v = other as _$AddFriendshipRequest;
  }

  @override
  void update(void Function(AddFriendshipRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddFriendshipRequest build() => _build();

  _$AddFriendshipRequest _build() {
    final _$result = _$v ??
        _$AddFriendshipRequest._(
          user1Id: BuiltValueNullFieldError.checkNotNull(
              user1Id, r'AddFriendshipRequest', 'user1Id'),
          user2Id: BuiltValueNullFieldError.checkNotNull(
              user2Id, r'AddFriendshipRequest', 'user2Id'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
