// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BalanceUser extends BalanceUser {
  @override
  final UserResponse? user1;
  @override
  final UserResponse? user2;
  @override
  final double? balance;

  factory _$BalanceUser([void Function(BalanceUserBuilder)? updates]) =>
      (BalanceUserBuilder()..update(updates))._build();

  _$BalanceUser._({this.user1, this.user2, this.balance}) : super._();
  @override
  BalanceUser rebuild(void Function(BalanceUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BalanceUserBuilder toBuilder() => BalanceUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BalanceUser &&
        user1 == other.user1 &&
        user2 == other.user2 &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user1.hashCode);
    _$hash = $jc(_$hash, user2.hashCode);
    _$hash = $jc(_$hash, balance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BalanceUser')
          ..add('user1', user1)
          ..add('user2', user2)
          ..add('balance', balance))
        .toString();
  }
}

class BalanceUserBuilder implements Builder<BalanceUser, BalanceUserBuilder> {
  _$BalanceUser? _$v;

  UserResponseBuilder? _user1;
  UserResponseBuilder get user1 => _$this._user1 ??= UserResponseBuilder();
  set user1(UserResponseBuilder? user1) => _$this._user1 = user1;

  UserResponseBuilder? _user2;
  UserResponseBuilder get user2 => _$this._user2 ??= UserResponseBuilder();
  set user2(UserResponseBuilder? user2) => _$this._user2 = user2;

  double? _balance;
  double? get balance => _$this._balance;
  set balance(double? balance) => _$this._balance = balance;

  BalanceUserBuilder() {
    BalanceUser._defaults(this);
  }

  BalanceUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1 = $v.user1?.toBuilder();
      _user2 = $v.user2?.toBuilder();
      _balance = $v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BalanceUser other) {
    _$v = other as _$BalanceUser;
  }

  @override
  void update(void Function(BalanceUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BalanceUser build() => _build();

  _$BalanceUser _build() {
    _$BalanceUser _$result;
    try {
      _$result = _$v ??
          _$BalanceUser._(
            user1: _user1?.build(),
            user2: _user2?.build(),
            balance: balance,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user1';
        _user1?.build();
        _$failedField = 'user2';
        _user2?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'BalanceUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
