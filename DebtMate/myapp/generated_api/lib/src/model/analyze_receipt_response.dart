//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/receipt_item_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'analyze_receipt_response.g.dart';

/// AnalyzeReceiptResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [items] 
@BuiltValue()
abstract class AnalyzeReceiptResponse implements Built<AnalyzeReceiptResponse, AnalyzeReceiptResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'items')
  BuiltList<ReceiptItemResponse>? get items;

  AnalyzeReceiptResponse._();

  factory AnalyzeReceiptResponse([void updates(AnalyzeReceiptResponseBuilder b)]) = _$AnalyzeReceiptResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AnalyzeReceiptResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AnalyzeReceiptResponse> get serializer => _$AnalyzeReceiptResponseSerializer();
}

class _$AnalyzeReceiptResponseSerializer implements PrimitiveSerializer<AnalyzeReceiptResponse> {
  @override
  final Iterable<Type> types = const [AnalyzeReceiptResponse, _$AnalyzeReceiptResponse];

  @override
  final String wireName = r'AnalyzeReceiptResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AnalyzeReceiptResponse object, {
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
    if (object.items != null) {
      yield r'items';
      yield serializers.serialize(
        object.items,
        specifiedType: const FullType.nullable(BuiltList, [FullType(ReceiptItemResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AnalyzeReceiptResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AnalyzeReceiptResponseBuilder result,
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
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(ReceiptItemResponse)]),
          ) as BuiltList<ReceiptItemResponse>?;
          if (valueDes == null) continue;
          result.items.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AnalyzeReceiptResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AnalyzeReceiptResponseBuilder();
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

