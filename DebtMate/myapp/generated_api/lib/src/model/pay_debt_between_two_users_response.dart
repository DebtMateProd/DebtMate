//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pay_debt_between_two_users_response.g.dart';

/// PayDebtBetweenTwoUsersResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class PayDebtBetweenTwoUsersResponse implements Built<PayDebtBetweenTwoUsersResponse, PayDebtBetweenTwoUsersResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  PayDebtBetweenTwoUsersResponse._();

  factory PayDebtBetweenTwoUsersResponse([void updates(PayDebtBetweenTwoUsersResponseBuilder b)]) = _$PayDebtBetweenTwoUsersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PayDebtBetweenTwoUsersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PayDebtBetweenTwoUsersResponse> get serializer => _$PayDebtBetweenTwoUsersResponseSerializer();
}

class _$PayDebtBetweenTwoUsersResponseSerializer implements PrimitiveSerializer<PayDebtBetweenTwoUsersResponse> {
  @override
  final Iterable<Type> types = const [PayDebtBetweenTwoUsersResponse, _$PayDebtBetweenTwoUsersResponse];

  @override
  final String wireName = r'PayDebtBetweenTwoUsersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PayDebtBetweenTwoUsersResponse object, {
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
  }

  @override
  Object serialize(
    Serializers serializers,
    PayDebtBetweenTwoUsersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PayDebtBetweenTwoUsersResponseBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PayDebtBetweenTwoUsersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PayDebtBetweenTwoUsersResponseBuilder();
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

