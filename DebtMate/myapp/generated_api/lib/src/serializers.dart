//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/accept_friendship_request.dart';
import 'package:openapi/src/model/accept_friendship_response.dart';
import 'package:openapi/src/model/add_friendship_request.dart';
import 'package:openapi/src/model/add_friendship_response.dart';
import 'package:openapi/src/model/add_new_reckoning_request.dart';
import 'package:openapi/src/model/add_new_reckoning_response.dart';
import 'package:openapi/src/model/balance_user.dart';
import 'package:openapi/src/model/balance_user_response.dart';
import 'package:openapi/src/model/currency_response.dart';
import 'package:openapi/src/model/debtor_info.dart';
import 'package:openapi/src/model/get_all_currencies_response.dart';
import 'package:openapi/src/model/get_all_response.dart';
import 'package:openapi/src/model/get_currency_by_code_response.dart';
import 'package:openapi/src/model/get_user_debt_response.dart';
import 'package:openapi/src/model/get_user_debtor_debts_response.dart';
import 'package:openapi/src/model/get_user_friend_list_response.dart';
import 'package:openapi/src/model/get_user_friend_requests_list_response.dart';
import 'package:openapi/src/model/get_user_pending_friend_list_response.dart';
import 'package:openapi/src/model/get_user_response.dart';
import 'package:openapi/src/model/login_request.dart';
import 'package:openapi/src/model/login_response.dart';
import 'package:openapi/src/model/pay_debt_between_two_users_request.dart';
import 'package:openapi/src/model/pay_debt_between_two_users_response.dart';
import 'package:openapi/src/model/pay_user_debt_request.dart';
import 'package:openapi/src/model/pay_user_debt_response.dart';
import 'package:openapi/src/model/register_request.dart';
import 'package:openapi/src/model/register_response.dart';
import 'package:openapi/src/model/remove_friendship_request.dart';
import 'package:openapi/src/model/remove_friendship_response.dart';
import 'package:openapi/src/model/update_reckoning_request.dart';
import 'package:openapi/src/model/update_reckoning_response.dart';
import 'package:openapi/src/model/update_user_request.dart';
import 'package:openapi/src/model/update_user_response.dart';
import 'package:openapi/src/model/user_debt.dart';
import 'package:openapi/src/model/user_debt_response.dart';
import 'package:openapi/src/model/user_debtor_debts.dart';
import 'package:openapi/src/model/user_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  AcceptFriendshipRequest,
  AcceptFriendshipResponse,
  AddFriendshipRequest,
  AddFriendshipResponse,
  AddNewReckoningRequest,
  AddNewReckoningResponse,
  BalanceUser,
  BalanceUserResponse,
  CurrencyResponse,
  DebtorInfo,
  GetAllCurrenciesResponse,
  GetAllResponse,
  GetCurrencyByCodeResponse,
  GetUserDebtResponse,
  GetUserDebtorDebtsResponse,
  GetUserFriendListResponse,
  GetUserFriendRequestsListResponse,
  GetUserPendingFriendListResponse,
  GetUserResponse,
  LoginRequest,
  LoginResponse,
  PayDebtBetweenTwoUsersRequest,
  PayDebtBetweenTwoUsersResponse,
  PayUserDebtRequest,
  PayUserDebtResponse,
  RegisterRequest,
  RegisterResponse,
  RemoveFriendshipRequest,
  RemoveFriendshipResponse,
  UpdateReckoningRequest,
  UpdateReckoningResponse,
  UpdateUserRequest,
  UpdateUserResponse,
  UserDebt,
  UserDebtResponse,
  UserDebtorDebts,
  UserResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
