// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'debtor_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DebtorInfo extends DebtorInfo {
  @override
  final UserResponse? debtor;
  @override
  final double? owedAmount;
  @override
  final bool? isPaid;

  factory _$DebtorInfo([void Function(DebtorInfoBuilder)? updates]) =>
      (DebtorInfoBuilder()..update(updates))._build();

  _$DebtorInfo._({this.debtor, this.owedAmount, this.isPaid}) : super._();
  @override
  DebtorInfo rebuild(void Function(DebtorInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DebtorInfoBuilder toBuilder() => DebtorInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DebtorInfo &&
        debtor == other.debtor &&
        owedAmount == other.owedAmount &&
        isPaid == other.isPaid;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, debtor.hashCode);
    _$hash = $jc(_$hash, owedAmount.hashCode);
    _$hash = $jc(_$hash, isPaid.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DebtorInfo')
          ..add('debtor', debtor)
          ..add('owedAmount', owedAmount)
          ..add('isPaid', isPaid))
        .toString();
  }
}

class DebtorInfoBuilder implements Builder<DebtorInfo, DebtorInfoBuilder> {
  _$DebtorInfo? _$v;

  UserResponseBuilder? _debtor;
  UserResponseBuilder get debtor => _$this._debtor ??= UserResponseBuilder();
  set debtor(UserResponseBuilder? debtor) => _$this._debtor = debtor;

  double? _owedAmount;
  double? get owedAmount => _$this._owedAmount;
  set owedAmount(double? owedAmount) => _$this._owedAmount = owedAmount;

  bool? _isPaid;
  bool? get isPaid => _$this._isPaid;
  set isPaid(bool? isPaid) => _$this._isPaid = isPaid;

  DebtorInfoBuilder() {
    DebtorInfo._defaults(this);
  }

  DebtorInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _debtor = $v.debtor?.toBuilder();
      _owedAmount = $v.owedAmount;
      _isPaid = $v.isPaid;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DebtorInfo other) {
    _$v = other as _$DebtorInfo;
  }

  @override
  void update(void Function(DebtorInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DebtorInfo build() => _build();

  _$DebtorInfo _build() {
    _$DebtorInfo _$result;
    try {
      _$result = _$v ??
          _$DebtorInfo._(
            debtor: _debtor?.build(),
            owedAmount: owedAmount,
            isPaid: isPaid,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'debtor';
        _debtor?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DebtorInfo', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
