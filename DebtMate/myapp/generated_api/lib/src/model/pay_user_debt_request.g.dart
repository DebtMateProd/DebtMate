// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_user_debt_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PayUserDebtRequest extends PayUserDebtRequest {
  @override
  final String? userId;
  @override
  final String? reckoningId;

  factory _$PayUserDebtRequest(
          [void Function(PayUserDebtRequestBuilder)? updates]) =>
      (PayUserDebtRequestBuilder()..update(updates))._build();

  _$PayUserDebtRequest._({this.userId, this.reckoningId}) : super._();
  @override
  PayUserDebtRequest rebuild(
          void Function(PayUserDebtRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayUserDebtRequestBuilder toBuilder() =>
      PayUserDebtRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayUserDebtRequest &&
        userId == other.userId &&
        reckoningId == other.reckoningId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, reckoningId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PayUserDebtRequest')
          ..add('userId', userId)
          ..add('reckoningId', reckoningId))
        .toString();
  }
}

class PayUserDebtRequestBuilder
    implements Builder<PayUserDebtRequest, PayUserDebtRequestBuilder> {
  _$PayUserDebtRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _reckoningId;
  String? get reckoningId => _$this._reckoningId;
  set reckoningId(String? reckoningId) => _$this._reckoningId = reckoningId;

  PayUserDebtRequestBuilder() {
    PayUserDebtRequest._defaults(this);
  }

  PayUserDebtRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _reckoningId = $v.reckoningId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayUserDebtRequest other) {
    _$v = other as _$PayUserDebtRequest;
  }

  @override
  void update(void Function(PayUserDebtRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PayUserDebtRequest build() => _build();

  _$PayUserDebtRequest _build() {
    final _$result = _$v ??
        _$PayUserDebtRequest._(
          userId: userId,
          reckoningId: reckoningId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
