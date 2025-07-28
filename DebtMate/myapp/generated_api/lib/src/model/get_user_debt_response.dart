//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_debt_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_user_debt_response.g.dart';

/// GetUserDebtResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [userDebts] 
@BuiltValue()
abstract class GetUserDebtResponse implements Built<GetUserDebtResponse, GetUserDebtResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'userDebts')
  BuiltList<UserDebtResponse>? get userDebts;

  GetUserDebtResponse._();

  factory GetUserDebtResponse([void updates(GetUserDebtResponseBuilder b)]) = _$GetUserDebtResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetUserDebtResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetUserDebtResponse> get serializer => _$GetUserDebtResponseSerializer();
}

class _$GetUserDebtResponseSerializer implements PrimitiveSerializer<GetUserDebtResponse> {
  @override
  final Iterable<Type> types = const [GetUserDebtResponse, _$GetUserDebtResponse];

  @override
  final String wireName = r'GetUserDebtResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetUserDebtResponse object, {
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
    if (object.userDebts != null) {
      yield r'userDebts';
      yield serializers.serialize(
        object.userDebts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebtResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetUserDebtResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetUserDebtResponseBuilder result,
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
        case r'userDebts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebtResponse)]),
          ) as BuiltList<UserDebtResponse>?;
          if (valueDes == null) continue;
          result.userDebts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetUserDebtResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetUserDebtResponseBuilder();
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

