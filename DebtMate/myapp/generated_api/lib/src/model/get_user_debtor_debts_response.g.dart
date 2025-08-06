// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_debtor_debts_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUserDebtorDebtsResponse extends GetUserDebtorDebtsResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<UserDebtorDebts>? userDebtorDebts;

  factory _$GetUserDebtorDebtsResponse(
          [void Function(GetUserDebtorDebtsResponseBuilder)? updates]) =>
      (GetUserDebtorDebtsResponseBuilder()..update(updates))._build();

  _$GetUserDebtorDebtsResponse._(
      {this.success, this.message, this.userDebtorDebts})
      : super._();
  @override
  GetUserDebtorDebtsResponse rebuild(
          void Function(GetUserDebtorDebtsResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserDebtorDebtsResponseBuilder toBuilder() =>
      GetUserDebtorDebtsResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserDebtorDebtsResponse &&
        success == other.success &&
        message == other.message &&
        userDebtorDebts == other.userDebtorDebts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, userDebtorDebts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUserDebtorDebtsResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('userDebtorDebts', userDebtorDebts))
        .toString();
  }
}

class GetUserDebtorDebtsResponseBuilder
    implements
        Builder<GetUserDebtorDebtsResponse, GetUserDebtorDebtsResponseBuilder> {
  _$GetUserDebtorDebtsResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<UserDebtorDebts>? _userDebtorDebts;
  ListBuilder<UserDebtorDebts> get userDebtorDebts =>
      _$this._userDebtorDebts ??= ListBuilder<UserDebtorDebts>();
  set userDebtorDebts(ListBuilder<UserDebtorDebts>? userDebtorDebts) =>
      _$this._userDebtorDebts = userDebtorDebts;

  GetUserDebtorDebtsResponseBuilder() {
    GetUserDebtorDebtsResponse._defaults(this);
  }

  GetUserDebtorDebtsResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _userDebtorDebts = $v.userDebtorDebts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUserDebtorDebtsResponse other) {
    _$v = other as _$GetUserDebtorDebtsResponse;
  }

  @override
  void update(void Function(GetUserDebtorDebtsResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUserDebtorDebtsResponse build() => _build();

  _$GetUserDebtorDebtsResponse _build() {
    _$GetUserDebtorDebtsResponse _$result;
    try {
      _$result = _$v ??
          _$GetUserDebtorDebtsResponse._(
            success: success,
            message: message,
            userDebtorDebts: _userDebtorDebts?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userDebtorDebts';
        _userDebtorDebts?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GetUserDebtorDebtsResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
