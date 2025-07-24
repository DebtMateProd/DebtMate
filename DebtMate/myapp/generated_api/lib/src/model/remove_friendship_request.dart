//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'remove_friendship_request.g.dart';

/// RemoveFriendshipRequest
///
/// Properties:
/// * [user1Id] 
/// * [user2Id] 
@BuiltValue()
abstract class RemoveFriendshipRequest implements Built<RemoveFriendshipRequest, RemoveFriendshipRequestBuilder> {
  @BuiltValueField(wireName: r'user1Id')
  String get user1Id;

  @BuiltValueField(wireName: r'user2Id')
  String get user2Id;

  RemoveFriendshipRequest._();

  factory RemoveFriendshipRequest([void updates(RemoveFriendshipRequestBuilder b)]) = _$RemoveFriendshipRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RemoveFriendshipRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RemoveFriendshipRequest> get serializer => _$RemoveFriendshipRequestSerializer();
}

class _$RemoveFriendshipRequestSerializer implements PrimitiveSerializer<RemoveFriendshipRequest> {
  @override
  final Iterable<Type> types = const [RemoveFriendshipRequest, _$RemoveFriendshipRequest];

  @override
  final String wireName = r'RemoveFriendshipRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RemoveFriendshipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user1Id';
    yield serializers.serialize(
      object.user1Id,
      specifiedType: const FullType(String),
    );
    yield r'user2Id';
    yield serializers.serialize(
      object.user2Id,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RemoveFriendshipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RemoveFriendshipRequestBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RemoveFriendshipRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RemoveFriendshipRequestBuilder();
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

