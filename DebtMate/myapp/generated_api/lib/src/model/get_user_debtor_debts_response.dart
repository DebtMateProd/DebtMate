//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_debtor_debts.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_user_debtor_debts_response.g.dart';

/// GetUserDebtorDebtsResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [userDebtorDebts] 
@BuiltValue()
abstract class GetUserDebtorDebtsResponse implements Built<GetUserDebtorDebtsResponse, GetUserDebtorDebtsResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'userDebtorDebts')
  BuiltList<UserDebtorDebts>? get userDebtorDebts;

  GetUserDebtorDebtsResponse._();

  factory GetUserDebtorDebtsResponse([void updates(GetUserDebtorDebtsResponseBuilder b)]) = _$GetUserDebtorDebtsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetUserDebtorDebtsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetUserDebtorDebtsResponse> get serializer => _$GetUserDebtorDebtsResponseSerializer();
}

class _$GetUserDebtorDebtsResponseSerializer implements PrimitiveSerializer<GetUserDebtorDebtsResponse> {
  @override
  final Iterable<Type> types = const [GetUserDebtorDebtsResponse, _$GetUserDebtorDebtsResponse];

  @override
  final String wireName = r'GetUserDebtorDebtsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetUserDebtorDebtsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.success != null) {
      yield r'success';
      yield serializers.serialize(
        object.success,
        specifiedType: const FullType(bool),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.userDebtorDebts != null) {
      yield r'userDebtorDebts';
      yield serializers.serialize(
        object.userDebtorDebts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebtorDebts)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetUserDebtorDebtsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetUserDebtorDebtsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'success':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.success = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.message = valueDes;
          break;
        case r'userDebtorDebts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebtorDebts)]),
          ) as BuiltList<UserDebtorDebts>?;
          if (valueDes == null) continue;
          result.userDebtorDebts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetUserDebtorDebtsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetUserDebtorDebtsResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

