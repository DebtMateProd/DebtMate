// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_debtor_debts.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDebtorDebts extends UserDebtorDebts {
  @override
  final String? reckoningId;
  @override
  final String? reckoningName;
  @override
  final String? description;
  @override
  final String? currencyCode;
  @override
  final BuiltList<DebtorInfo>? debtors;

  factory _$UserDebtorDebts([void Function(UserDebtorDebtsBuilder)? updates]) =>
      (UserDebtorDebtsBuilder()..update(updates))._build();

  _$UserDebtorDebts._(
      {this.reckoningId,
      this.reckoningName,
      this.description,
      this.currencyCode,
      this.debtors})
      : super._();
  @override
  UserDebtorDebts rebuild(void Function(UserDebtorDebtsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDebtorDebtsBuilder toBuilder() => UserDebtorDebtsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDebtorDebts &&
        reckoningId == other.reckoningId &&
        reckoningName == other.reckoningName &&
        description == other.description &&
        currencyCode == other.currencyCode &&
        debtors == other.debtors;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reckoningId.hashCode);
    _$hash = $jc(_$hash, reckoningName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, debtors.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDebtorDebts')
          ..add('reckoningId', reckoningId)
          ..add('reckoningName', reckoningName)
          ..add('description', description)
          ..add('currencyCode', currencyCode)
          ..add('debtors', debtors))
        .toString();
  }
}

class UserDebtorDebtsBuilder
    implements Builder<UserDebtorDebts, UserDebtorDebtsBuilder> {
  _$UserDebtorDebts? _$v;

  String? _reckoningId;
  String? get reckoningId => _$this._reckoningId;
  set reckoningId(String? reckoningId) => _$this._reckoningId = reckoningId;

  String? _reckoningName;
  String? get reckoningName => _$this._reckoningName;
  set reckoningName(String? reckoningName) =>
      _$this._reckoningName = reckoningName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  ListBuilder<DebtorInfo>? _debtors;
  ListBuilder<DebtorInfo> get debtors =>
      _$this._debtors ??= ListBuilder<DebtorInfo>();
  set debtors(ListBuilder<DebtorInfo>? debtors) => _$this._debtors = debtors;

  UserDebtorDebtsBuilder() {
    UserDebtorDebts._defaults(this);
  }

  UserDebtorDebtsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reckoningId = $v.reckoningId;
      _reckoningName = $v.reckoningName;
      _description = $v.description;
      _currencyCode = $v.currencyCode;
      _debtors = $v.debtors?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDebtorDebts other) {
    _$v = other as _$UserDebtorDebts;
  }

  @override
  void update(void Function(UserDebtorDebtsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDebtorDebts build() => _build();

  _$UserDebtorDebts _build() {
    _$UserDebtorDebts _$result;
    try {
      _$result = _$v ??
          _$UserDebtorDebts._(
            reckoningId: reckoningId,
            reckoningName: reckoningName,
            description: description,
            currencyCode: currencyCode,
            debtors: _debtors?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'debtors';
        _debtors?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UserDebtorDebts', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
