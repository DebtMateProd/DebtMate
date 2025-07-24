//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_friendship_response.g.dart';

/// AddFriendshipResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class AddFriendshipResponse implements Built<AddFriendshipResponse, AddFriendshipResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  AddFriendshipResponse._();

  factory AddFriendshipResponse([void updates(AddFriendshipResponseBuilder b)]) = _$AddFriendshipResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddFriendshipResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddFriendshipResponse> get serializer => _$AddFriendshipResponseSerializer();
}

class _$AddFriendshipResponseSerializer implements PrimitiveSerializer<AddFriendshipResponse> {
  @override
  final Iterable<Type> types = const [AddFriendshipResponse, _$AddFriendshipResponse];

  @override
  final String wireName = r'AddFriendshipResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddFriendshipResponse object, {
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
    AddFriendshipResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddFriendshipResponseBuilder result,
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
  AddFriendshipResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddFriendshipResponseBuilder();
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

