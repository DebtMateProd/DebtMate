// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_debt.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDebt extends UserDebt {
  @override
  final String? userId;
  @override
  final double? owedAmount;

  factory _$UserDebt([void Function(UserDebtBuilder)? updates]) =>
      (UserDebtBuilder()..update(updates))._build();

  _$UserDebt._({this.userId, this.owedAmount}) : super._();
  @override
  UserDebt rebuild(void Function(UserDebtBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDebtBuilder toBuilder() => UserDebtBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDebt &&
        userId == other.userId &&
        owedAmount == other.owedAmount;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, owedAmount.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDebt')
          ..add('userId', userId)
          ..add('owedAmount', owedAmount))
        .toString();
  }
}

class UserDebtBuilder implements Builder<UserDebt, UserDebtBuilder> {
  _$UserDebt? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  double? _owedAmount;
  double? get owedAmount => _$this._owedAmount;
  set owedAmount(double? owedAmount) => _$this._owedAmount = owedAmount;

  UserDebtBuilder() {
    UserDebt._defaults(this);
  }

  UserDebtBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _owedAmount = $v.owedAmount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDebt other) {
    _$v = other as _$UserDebt;
  }

  @override
  void update(void Function(UserDebtBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDebt build() => _build();

  _$UserDebt _build() {
    final _$result = _$v ??
        _$UserDebt._(
          userId: userId,
          owedAmount: owedAmount,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
