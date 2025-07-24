//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remove_friendship_response.g.dart';

/// RemoveFriendshipResponse
///
/// Properties:
/// * [success] 
/// * [message] 
@BuiltValue()
abstract class RemoveFriendshipResponse implements Built<RemoveFriendshipResponse, RemoveFriendshipResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  RemoveFriendshipResponse._();

  factory RemoveFriendshipResponse([void updates(RemoveFriendshipResponseBuilder b)]) = _$RemoveFriendshipResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RemoveFriendshipResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoveFriendshipResponse> get serializer => _$RemoveFriendshipResponseSerializer();
}

class _$RemoveFriendshipResponseSerializer implements PrimitiveSerializer<RemoveFriendshipResponse> {
  @override
  final Iterable<Type> types = const [RemoveFriendshipResponse, _$RemoveFriendshipResponse];

  @override
  final String wireName = r'RemoveFriendshipResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RemoveFriendshipResponse object, {
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
    RemoveFriendshipResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RemoveFriendshipResponseBuilder result,
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
  RemoveFriendshipResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoveFriendshipResponseBuilder();
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

