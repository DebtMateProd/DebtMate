// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_debt_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetUserDebtResponse extends GetUserDebtResponse {
  @override
  final bool? success;
  @override
  final String? message;
  @override
  final BuiltList<UserDebtResponse>? userDebts;

  factory _$GetUserDebtResponse(
          [void Function(GetUserDebtResponseBuilder)? updates]) =>
      (GetUserDebtResponseBuilder()..update(updates))._build();

  _$GetUserDebtResponse._({this.success, this.message, this.userDebts})
      : super._();
  @override
  GetUserDebtResponse rebuild(
          void Function(GetUserDebtResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetUserDebtResponseBuilder toBuilder() =>
      GetUserDebtResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetUserDebtResponse &&
        success == other.success &&
        message == other.message &&
        userDebts == other.userDebts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, success.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, userDebts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetUserDebtResponse')
          ..add('success', success)
          ..add('message', message)
          ..add('userDebts', userDebts))
        .toString();
  }
}

class GetUserDebtResponseBuilder
    implements Builder<GetUserDebtResponse, GetUserDebtResponseBuilder> {
  _$GetUserDebtResponse? _$v;

  bool? _success;
  bool? get success => _$this._success;
  set success(bool? success) => _$this._success = success;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<UserDebtResponse>? _userDebts;
  ListBuilder<UserDebtResponse> get userDebts =>
      _$this._userDebts ??= ListBuilder<UserDebtResponse>();
  set userDebts(ListBuilder<UserDebtResponse>? userDebts) =>
      _$this._userDebts = userDebts;

  GetUserDebtResponseBuilder() {
    GetUserDebtResponse._defaults(this);
  }

  GetUserDebtResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _message = $v.message;
      _userDebts = $v.userDebts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetUserDebtResponse other) {
    _$v = other as _$GetUserDebtResponse;
  }

  @override
  void update(void Function(GetUserDebtResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetUserDebtResponse build() => _build();

  _$GetUserDebtResponse _build() {
    _$GetUserDebtResponse _$result;
    try {
      _$result = _$v ??
          _$GetUserDebtResponse._(
            success: success,
            message: message,
            userDebts: _userDebts?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'userDebts';
        _userDebts?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GetUserDebtResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
