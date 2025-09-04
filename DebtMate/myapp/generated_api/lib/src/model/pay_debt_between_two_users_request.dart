//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pay_debt_between_two_users_request.g.dart';

/// PayDebtBetweenTwoUsersRequest
///
/// Properties:
/// * [user1Id] 
/// * [user2Id] 
/// * [currencyCode] 
@BuiltValue()
abstract class PayDebtBetweenTwoUsersRequest implements Built<PayDebtBetweenTwoUsersRequest, PayDebtBetweenTwoUsersRequestBuilder> {
  @BuiltValueField(wireName: r'user1Id')
  String? get user1Id;

  @BuiltValueField(wireName: r'user2Id')
  String? get user2Id;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  PayDebtBetweenTwoUsersRequest._();

  factory PayDebtBetweenTwoUsersRequest([void updates(PayDebtBetweenTwoUsersRequestBuilder b)]) = _$PayDebtBetweenTwoUsersRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PayDebtBetweenTwoUsersRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PayDebtBetweenTwoUsersRequest> get serializer => _$PayDebtBetweenTwoUsersRequestSerializer();
}

class _$PayDebtBetweenTwoUsersRequestSerializer implements PrimitiveSerializer<PayDebtBetweenTwoUsersRequest> {
  @override
  final Iterable<Type> types = const [PayDebtBetweenTwoUsersRequest, _$PayDebtBetweenTwoUsersRequest];

  @override
  final String wireName = r'PayDebtBetweenTwoUsersRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PayDebtBetweenTwoUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.user1Id != null) {
      yield r'user1Id';
      yield serializers.serialize(
        object.user1Id,
        specifiedType: const FullType(String),
      );
    }
    if (object.user2Id != null) {
      yield r'user2Id';
      yield serializers.serialize(
        object.user2Id,
        specifiedType: const FullType(String),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PayDebtBetweenTwoUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PayDebtBetweenTwoUsersRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user1Id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.user1Id = valueDes;
          break;
        case r'user2Id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.user2Id = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PayDebtBetweenTwoUsersRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PayDebtBetweenTwoUsersRequestBuilder();
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

