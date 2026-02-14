//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'receipt_item_response.g.dart';

/// ReceiptItemResponse
///
/// Properties:
/// * [item] 
/// * [price] 
@BuiltValue()
abstract class ReceiptItemResponse implements Built<ReceiptItemResponse, ReceiptItemResponseBuilder> {
  @BuiltValueField(wireName: r'item')
  String? get item;

  @BuiltValueField(wireName: r'price')
  double? get price;

  ReceiptItemResponse._();

  factory ReceiptItemResponse([void updates(ReceiptItemResponseBuilder b)]) = _$ReceiptItemResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ReceiptItemResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ReceiptItemResponse> get serializer => _$ReceiptItemResponseSerializer();
}

class _$ReceiptItemResponseSerializer implements PrimitiveSerializer<ReceiptItemResponse> {
  @override
  final Iterable<Type> types = const [ReceiptItemResponse, _$ReceiptItemResponse];

  @override
  final String wireName = r'ReceiptItemResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ReceiptItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.item != null) {
      yield r'item';
      yield serializers.serialize(
        object.item,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.price != null) {
      yield r'price';
      yield serializers.serialize(
        object.price,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ReceiptItemResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ReceiptItemResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'item':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.item = valueDes;
          break;
        case r'price':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.price = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ReceiptItemResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ReceiptItemResponseBuilder();
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

