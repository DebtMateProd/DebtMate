// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_debt_between_two_users_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PayDebtBetweenTwoUsersRequest extends PayDebtBetweenTwoUsersRequest {
  @override
  final String? user1Id;
  @override
  final String? user2Id;
  @override
  final String? currencyCode;

  factory _$PayDebtBetweenTwoUsersRequest(
          [void Function(PayDebtBetweenTwoUsersRequestBuilder)? updates]) =>
      (PayDebtBetweenTwoUsersRequestBuilder()..update(updates))._build();

  _$PayDebtBetweenTwoUsersRequest._(
      {this.user1Id, this.user2Id, this.currencyCode})
      : super._();
  @override
  PayDebtBetweenTwoUsersRequest rebuild(
          void Function(PayDebtBetweenTwoUsersRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PayDebtBetweenTwoUsersRequestBuilder toBuilder() =>
      PayDebtBetweenTwoUsersRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PayDebtBetweenTwoUsersRequest &&
        user1Id == other.user1Id &&
        user2Id == other.user2Id &&
        currencyCode == other.currencyCode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user1Id.hashCode);
    _$hash = $jc(_$hash, user2Id.hashCode);
    _$hash = $jc(_$hash, currencyCode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PayDebtBetweenTwoUsersRequest')
          ..add('user1Id', user1Id)
          ..add('user2Id', user2Id)
          ..add('currencyCode', currencyCode))
        .toString();
  }
}

class PayDebtBetweenTwoUsersRequestBuilder
    implements
        Builder<PayDebtBetweenTwoUsersRequest,
            PayDebtBetweenTwoUsersRequestBuilder> {
  _$PayDebtBetweenTwoUsersRequest? _$v;

  String? _user1Id;
  String? get user1Id => _$this._user1Id;
  set user1Id(String? user1Id) => _$this._user1Id = user1Id;

  String? _user2Id;
  String? get user2Id => _$this._user2Id;
  set user2Id(String? user2Id) => _$this._user2Id = user2Id;

  String? _currencyCode;
  String? get currencyCode => _$this._currencyCode;
  set currencyCode(String? currencyCode) => _$this._currencyCode = currencyCode;

  PayDebtBetweenTwoUsersRequestBuilder() {
    PayDebtBetweenTwoUsersRequest._defaults(this);
  }

  PayDebtBetweenTwoUsersRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user1Id = $v.user1Id;
      _user2Id = $v.user2Id;
      _currencyCode = $v.currencyCode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PayDebtBetweenTwoUsersRequest other) {
    _$v = other as _$PayDebtBetweenTwoUsersRequest;
  }

  @override
  void update(void Function(PayDebtBetweenTwoUsersRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PayDebtBetweenTwoUsersRequest build() => _build();

  _$PayDebtBetweenTwoUsersRequest _build() {
    final _$result = _$v ??
        _$PayDebtBetweenTwoUsersRequest._(
          user1Id: user1Id,
          user2Id: user2Id,
          currencyCode: currencyCode,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
