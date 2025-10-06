// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_reckoning_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateReckoningRequest extends UpdateReckoningRequest {
  @override
  final String? reckoningId;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? totalCost;
  @override
  final String? payerId;
  @override
  final String? currencyCode;
  @override
  final BuiltList<UserDebt>? debts;

  factory _$UpdateReckoningRequest(
          [void Function(UpdateReckoningRequestBuilder)? updates]) =>
      (UpdateReckoningRequestBuilder()..update(updates))._build();

  _$UpdateReckoningRequest._(
      {this.reckoningId,
      this.name,
      this.description,
      this.totalCost,
      this.payerId,
      this.currencyCode,
      this.debts})
      : super._();
  @override
  UpdateReckoningRequest rebuild(
          void Function(UpdateReckoningRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateReckoningRequestBuilder toBuilder() =>
      UpdateReckoningRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateReckoningRequest &&
        reckoningId == other.reckoningId &&
        name == other.name &&
        description == other.description &&
        totalCost == other.totalCost &&
        payerId == other.payerId &&
        currencyCode == other.currencyCode &&
        debts == other.debts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reckoningId.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, totalCost.hashCode);
    _$hash = $jc(_$hash, payerId.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jc(_$hash, debts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateReckoningRequest')
          ..add('reckoningId', reckoningId)
          ..add('name', name)
          ..add('description', description)
          ..add('totalCost', totalCost)
          ..add('payerId', payerId)
          ..add('currencyCode', currencyCode)
          ..add('debts', debts))
        .toString();
  }
}

class UpdateReckoningRequestBuilder
    implements Builder<UpdateReckoningRequest, UpdateReckoningRequestBuilder> {
  _$UpdateReckoningRequest? _$v;

  String? _reckoningId;
  String? get reckoningId => _$this._reckoningId;
  set reckoningId(String? reckoningId) => _$this._reckoningId = reckoningId;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  double? _totalCost;
  double? get totalCost => _$this._totalCost;
  set totalCost(double? totalCost) => _$this._totalCost = totalCost;

  String? _payerId;
  String? get payerId => _$this._payerId;
  set payerId(String? payerId) => _$this._payerId = payerId;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  ListBuilder<UserDebt>? _debts;
  ListBuilder<UserDebt> get debts => _$this._debts ??= ListBuilder<UserDebt>();
  set debts(ListBuilder<UserDebt>? debts) => _$this._debts = debts;

  UpdateReckoningRequestBuilder() {
    UpdateReckoningRequest._defaults(this);
  }

  UpdateReckoningRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reckoningId = $v.reckoningId;
      _name = $v.name;
      _description = $v.description;
      _totalCost = $v.totalCost;
      _payerId = $v.payerId;
      _currencyCode = $v.currencyCode;
      _debts = $v.debts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateReckoningRequest other) {
    _$v = other as _$UpdateReckoningRequest;
  }

  @override
  void update(void Function(UpdateReckoningRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateReckoningRequest build() => _build();

  _$UpdateReckoningRequest _build() {
    _$UpdateReckoningRequest _$result;
    try {
      _$result = _$v ??
          _$UpdateReckoningRequest._(
            reckoningId: reckoningId,
            name: name,
            description: description,
            totalCost: totalCost,
            payerId: payerId,
            currencyCode: currencyCode,
            debts: _debts?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'debts';
        _debts?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateReckoningRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
