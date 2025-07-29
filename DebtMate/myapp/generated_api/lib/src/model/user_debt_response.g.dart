// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_debt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDebtResponse extends UserDebtResponse {
  @override
  final String? reckoningId;
  @override
  final String? reckoningName;
  @override
  final String? description;
  @override
  final double? owedAmount;
  @override
  final bool? isPaid;
  @override
  final String? payerId;
  @override
  final String? payerName;

  factory _$UserDebtResponse(
          [void Function(UserDebtResponseBuilder)? updates]) =>
      (UserDebtResponseBuilder()..update(updates))._build();

  _$UserDebtResponse._(
      {this.reckoningId,
      this.reckoningName,
      this.description,
      this.owedAmount,
      this.isPaid,
      this.payerId,
      this.payerName})
      : super._();
  @override
  UserDebtResponse rebuild(void Function(UserDebtResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDebtResponseBuilder toBuilder() =>
      UserDebtResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDebtResponse &&
        reckoningId == other.reckoningId &&
        reckoningName == other.reckoningName &&
        description == other.description &&
        owedAmount == other.owedAmount &&
        isPaid == other.isPaid &&
        payerId == other.payerId &&
        payerName == other.payerName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reckoningId.hashCode);
    _$hash = $jc(_$hash, reckoningName.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, owedAmount.hashCode);
    _$hash = $jc(_$hash, isPaid.hashCode);
    _$hash = $jc(_$hash, payerId.hashCode);
    _$hash = $jc(_$hash, payerName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDebtResponse')
          ..add('reckoningId', reckoningId)
          ..add('reckoningName', reckoningName)
          ..add('description', description)
          ..add('owedAmount', owedAmount)
          ..add('isPaid', isPaid)
          ..add('payerId', payerId)
          ..add('payerName', payerName))
        .toString();
  }
}

class UserDebtResponseBuilder
    implements Builder<UserDebtResponse, UserDebtResponseBuilder> {
  _$UserDebtResponse? _$v;

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

  double? _owedAmount;
  double? get owedAmount => _$this._owedAmount;
  set owedAmount(double? owedAmount) => _$this._owedAmount = owedAmount;

  bool? _isPaid;
  bool? get isPaid => _$this._isPaid;
  set isPaid(bool? isPaid) => _$this._isPaid = isPaid;

  String? _payerId;
  String? get payerId => _$this._payerId;
  set payerId(String? payerId) => _$this._payerId = payerId;

  String? _payerName;
  String? get payerName => _$this._payerName;
  set payerName(String? payerName) => _$this._payerName = payerName;

  UserDebtResponseBuilder() {
    UserDebtResponse._defaults(this);
  }

  UserDebtResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reckoningId = $v.reckoningId;
      _reckoningName = $v.reckoningName;
      _description = $v.description;
      _owedAmount = $v.owedAmount;
      _isPaid = $v.isPaid;
      _payerId = $v.payerId;
      _payerName = $v.payerName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDebtResponse other) {
    _$v = other as _$UserDebtResponse;
  }

  @override
  void update(void Function(UserDebtResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDebtResponse build() => _build();

  _$UserDebtResponse _build() {
    final _$result = _$v ??
        _$UserDebtResponse._(
          reckoningId: reckoningId,
          reckoningName: reckoningName,
          description: description,
          owedAmount: owedAmount,
          isPaid: isPaid,
          payerId: payerId,
          payerName: payerName,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
