//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_user_pending_friend_list_response.g.dart';

/// GetUserPendingFriendListResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [users] 
@BuiltValue()
abstract class GetUserPendingFriendListResponse implements Built<GetUserPendingFriendListResponse, GetUserPendingFriendListResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'users')
  BuiltList<UserResponse>? get users;

  GetUserPendingFriendListResponse._();

  factory GetUserPendingFriendListResponse([void updates(GetUserPendingFriendListResponseBuilder b)]) = _$GetUserPendingFriendListResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetUserPendingFriendListResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetUserPendingFriendListResponse> get serializer => _$GetUserPendingFriendListResponseSerializer();
}

class _$GetUserPendingFriendListResponseSerializer implements PrimitiveSerializer<GetUserPendingFriendListResponse> {
  @override
  final Iterable<Type> types = const [GetUserPendingFriendListResponse, _$GetUserPendingFriendListResponse];

  @override
  final String wireName = r'GetUserPendingFriendListResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetUserPendingFriendListResponse object, {
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
    if (object.users != null) {
      yield r'users';
      yield serializers.serialize(
        object.users,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetUserPendingFriendListResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetUserPendingFriendListResponseBuilder result,
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
        case r'users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserResponse)]),
          ) as BuiltList<UserResponse>?;
          if (valueDes == null) continue;
          result.users.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetUserPendingFriendListResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetUserPendingFriendListResponseBuilder();
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

