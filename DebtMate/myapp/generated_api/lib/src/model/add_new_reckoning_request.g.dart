// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_reckoning_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddNewReckoningRequest extends AddNewReckoningRequest {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? totalCost;
  @override
  final String? payerId;
  @override
  final BuiltList<UserDebt>? debts;

  factory _$AddNewReckoningRequest(
          [void Function(AddNewReckoningRequestBuilder)? updates]) =>
      (AddNewReckoningRequestBuilder()..update(updates))._build();

  _$AddNewReckoningRequest._(
      {this.name, this.description, this.totalCost, this.payerId, this.debts})
      : super._();
  @override
  AddNewReckoningRequest rebuild(
          void Function(AddNewReckoningRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddNewReckoningRequestBuilder toBuilder() =>
      AddNewReckoningRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddNewReckoningRequest &&
        name == other.name &&
        description == other.description &&
        totalCost == other.totalCost &&
        payerId == other.payerId &&
        debts == other.debts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, totalCost.hashCode);
    _$hash = $jc(_$hash, payerId.hashCode);
    _$hash = $jc(_$hash, debts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddNewReckoningRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('totalCost', totalCost)
          ..add('payerId', payerId)
          ..add('debts', debts))
        .toString();
  }
}

class AddNewReckoningRequestBuilder
    implements Builder<AddNewReckoningRequest, AddNewReckoningRequestBuilder> {
  _$AddNewReckoningRequest? _$v;

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

  ListBuilder<UserDebt>? _debts;
  ListBuilder<UserDebt> get debts => _$this._debts ??= ListBuilder<UserDebt>();
  set debts(ListBuilder<UserDebt>? debts) => _$this._debts = debts;

  AddNewReckoningRequestBuilder() {
    AddNewReckoningRequest._defaults(this);
  }

  AddNewReckoningRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _totalCost = $v.totalCost;
      _payerId = $v.payerId;
      _debts = $v.debts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddNewReckoningRequest other) {
    _$v = other as _$AddNewReckoningRequest;
  }

  @override
  void update(void Function(AddNewReckoningRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddNewReckoningRequest build() => _build();

  _$AddNewReckoningRequest _build() {
    _$AddNewReckoningRequest _$result;
    try {
      _$result = _$v ??
          _$AddNewReckoningRequest._(
            name: name,
            description: description,
            totalCost: totalCost,
            payerId: payerId,
            debts: _debts?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'debts';
        _debts?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'AddNewReckoningRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
