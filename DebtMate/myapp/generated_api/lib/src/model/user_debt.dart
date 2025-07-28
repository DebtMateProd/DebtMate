//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_debt.g.dart';

/// UserDebt
///
/// Properties:
/// * [userId] 
/// * [owedAmount] 
@BuiltValue()
abstract class UserDebt implements Built<UserDebt, UserDebtBuilder> {
  @BuiltValueField(wireName: r'userId')
  String? get userId;

  @BuiltValueField(wireName: r'owedAmount')
  double? get owedAmount;

  UserDebt._();

  factory UserDebt([void updates(UserDebtBuilder b)]) = _$UserDebt;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserDebtBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDebt> get serializer => _$UserDebtSerializer();
}

class _$UserDebtSerializer implements PrimitiveSerializer<UserDebt> {
  @override
  final Iterable<Type> types = const [UserDebt, _$UserDebt];

  @override
  final String wireName = r'UserDebt';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserDebt object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.userId != null) {
      yield r'userId';
      yield serializers.serialize(
        object.userId,
        specifiedType: const FullType(String),
      );
    }
    if (object.owedAmount != null) {
      yield r'owedAmount';
      yield serializers.serialize(
        object.owedAmount,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserDebt object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserDebtBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'owedAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.owedAmount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserDebt deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDebtBuilder();
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

