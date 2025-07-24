//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'accept_friendship_request.g.dart';

/// AcceptFriendshipRequest
///
/// Properties:
/// * [user1Id] 
/// * [user2Id] 
@BuiltValue()
abstract class AcceptFriendshipRequest implements Built<AcceptFriendshipRequest, AcceptFriendshipRequestBuilder> {
  @BuiltValueField(wireName: r'user1Id')
  String get user1Id;

  @BuiltValueField(wireName: r'user2Id')
  String get user2Id;

  AcceptFriendshipRequest._();

  factory AcceptFriendshipRequest([void updates(AcceptFriendshipRequestBuilder b)]) = _$AcceptFriendshipRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AcceptFriendshipRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AcceptFriendshipRequest> get serializer => _$AcceptFriendshipRequestSerializer();
}

class _$AcceptFriendshipRequestSerializer implements PrimitiveSerializer<AcceptFriendshipRequest> {
  @override
  final Iterable<Type> types = const [AcceptFriendshipRequest, _$AcceptFriendshipRequest];

  @override
  final String wireName = r'AcceptFriendshipRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AcceptFriendshipRequest object, {
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
    AcceptFriendshipRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AcceptFriendshipRequestBuilder result,
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
  AcceptFriendshipRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AcceptFriendshipRequestBuilder();
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

