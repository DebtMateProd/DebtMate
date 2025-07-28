//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_new_reckoning_response.g.dart';

/// AddNewReckoningResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class AddNewReckoningResponse implements Built<AddNewReckoningResponse, AddNewReckoningResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  AddNewReckoningResponse._();

  factory AddNewReckoningResponse([void updates(AddNewReckoningResponseBuilder b)]) = _$AddNewReckoningResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddNewReckoningResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddNewReckoningResponse> get serializer => _$AddNewReckoningResponseSerializer();
}

class _$AddNewReckoningResponseSerializer implements PrimitiveSerializer<AddNewReckoningResponse> {
  @override
  final Iterable<Type> types = const [AddNewReckoningResponse, _$AddNewReckoningResponse];

  @override
  final String wireName = r'AddNewReckoningResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddNewReckoningResponse object, {
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
    AddNewReckoningResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddNewReckoningResponseBuilder result,
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
  AddNewReckoningResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddNewReckoningResponseBuilder();
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

