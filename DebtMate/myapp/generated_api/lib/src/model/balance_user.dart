//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'balance_user.g.dart';

/// BalanceUser
///
/// Properties:
/// * [user1] 
/// * [user2] 
/// * [currencyCode] 
/// * [balance] 
@BuiltValue()
abstract class BalanceUser implements Built<BalanceUser, BalanceUserBuilder> {
  @BuiltValueField(wireName: r'user1')
  UserResponse? get user1;

  @BuiltValueField(wireName: r'user2')
  UserResponse? get user2;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'balance')
  double? get balance;

  BalanceUser._();

  factory BalanceUser([void updates(BalanceUserBuilder b)]) = _$BalanceUser;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(BalanceUserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<BalanceUser> get serializer => _$BalanceUserSerializer();
}

class _$BalanceUserSerializer implements PrimitiveSerializer<BalanceUser> {
  @override
  final Iterable<Type> types = const [BalanceUser, _$BalanceUser];

  @override
  final String wireName = r'BalanceUser';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    BalanceUser object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.user1 != null) {
      yield r'user1';
      yield serializers.serialize(
        object.user1,
        specifiedType: const FullType(UserResponse),
      );
    }
    if (object.user2 != null) {
      yield r'user2';
      yield serializers.serialize(
        object.user2,
        specifiedType: const FullType(UserResponse),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.balance != null) {
      yield r'balance';
      yield serializers.serialize(
        object.balance,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    BalanceUser object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required BalanceUserBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponse),
          ) as UserResponse;
          result.user1.replace(valueDes);
          break;
        case r'user2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponse),
          ) as UserResponse;
          result.user2.replace(valueDes);
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        case r'balance':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.balance = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  BalanceUser deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = BalanceUserBuilder();
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

