//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pay_user_debt_request.g.dart';

/// PayUserDebtRequest
///
/// Properties:
/// * [userId] 
/// * [reckoningId] 
@BuiltValue()
abstract class PayUserDebtRequest implements Built<PayUserDebtRequest, PayUserDebtRequestBuilder> {
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'reckoningId')
  String? get reckoningId;

  PayUserDebtRequest._();

  factory PayUserDebtRequest([void updates(PayUserDebtRequestBuilder b)]) = _$PayUserDebtRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PayUserDebtRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PayUserDebtRequest> get serializer => _$PayUserDebtRequestSerializer();
}

class _$PayUserDebtRequestSerializer implements PrimitiveSerializer<PayUserDebtRequest> {
  @override
  final Iterable<Type> types = const [PayUserDebtRequest, _$PayUserDebtRequest];

  @override
  final String wireName = r'PayUserDebtRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PayUserDebtRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.reckoningId != null) {
      yield r'reckoningId';
      yield serializers.serialize(
        object.reckoningId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PayUserDebtRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PayUserDebtRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'reckoningId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reckoningId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PayUserDebtRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PayUserDebtRequestBuilder();
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

