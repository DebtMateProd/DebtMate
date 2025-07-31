//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pay_user_debt_response.g.dart';

/// PayUserDebtResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class PayUserDebtResponse implements Built<PayUserDebtResponse, PayUserDebtResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  PayUserDebtResponse._();

  factory PayUserDebtResponse([void updates(PayUserDebtResponseBuilder b)]) = _$PayUserDebtResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PayUserDebtResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PayUserDebtResponse> get serializer => _$PayUserDebtResponseSerializer();
}

class _$PayUserDebtResponseSerializer implements PrimitiveSerializer<PayUserDebtResponse> {
  @override
  final Iterable<Type> types = const [PayUserDebtResponse, _$PayUserDebtResponse];

  @override
  final String wireName = r'PayUserDebtResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PayUserDebtResponse object, {
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
    PayUserDebtResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PayUserDebtResponseBuilder result,
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
  PayUserDebtResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PayUserDebtResponseBuilder();
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

