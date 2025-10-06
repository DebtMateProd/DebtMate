//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_reckoning_response.g.dart';

/// UpdateReckoningResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class UpdateReckoningResponse implements Built<UpdateReckoningResponse, UpdateReckoningResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  UpdateReckoningResponse._();

  factory UpdateReckoningResponse([void updates(UpdateReckoningResponseBuilder b)]) = _$UpdateReckoningResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateReckoningResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateReckoningResponse> get serializer => _$UpdateReckoningResponseSerializer();
}

class _$UpdateReckoningResponseSerializer implements PrimitiveSerializer<UpdateReckoningResponse> {
  @override
  final Iterable<Type> types = const [UpdateReckoningResponse, _$UpdateReckoningResponse];

  @override
  final String wireName = r'UpdateReckoningResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateReckoningResponse object, {
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
    UpdateReckoningResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateReckoningResponseBuilder result,
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
  UpdateReckoningResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateReckoningResponseBuilder();
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

