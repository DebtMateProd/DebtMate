//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/balance_user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'balance_user_response.g.dart';

/// BalanceUserResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [balanceUsers] 
@BuiltValue()
abstract class BalanceUserResponse implements Built<BalanceUserResponse, BalanceUserResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'balanceUsers')
  BuiltList<BalanceUser>? get balanceUsers;

  BalanceUserResponse._();

  factory BalanceUserResponse([void updates(BalanceUserResponseBuilder b)]) = _$BalanceUserResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BalanceUserResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BalanceUserResponse> get serializer => _$BalanceUserResponseSerializer();
}

class _$BalanceUserResponseSerializer implements PrimitiveSerializer<BalanceUserResponse> {
  @override
  final Iterable<Type> types = const [BalanceUserResponse, _$BalanceUserResponse];

  @override
  final String wireName = r'BalanceUserResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BalanceUserResponse object, {
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
    if (object.balanceUsers != null) {
      yield r'balanceUsers';
      yield serializers.serialize(
        object.balanceUsers,
        specifiedType: const FullType.nullable(BuiltList, [FullType(BalanceUser)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BalanceUserResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BalanceUserResponseBuilder result,
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
        case r'balanceUsers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(BalanceUser)]),
          ) as BuiltList<BalanceUser>?;
          if (valueDes == null) continue;
          result.balanceUsers.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BalanceUserResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BalanceUserResponseBuilder();
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

