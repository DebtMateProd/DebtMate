//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/debtor_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_debtor_debts.g.dart';

/// UserDebtorDebts
///
/// Properties:
/// * [reckoningId] 
/// * [reckoningName] 
/// * [description] 
/// * [currencyCode] 
/// * [debtors] 
@BuiltValue()
abstract class UserDebtorDebts implements Built<UserDebtorDebts, UserDebtorDebtsBuilder> {
  @BuiltValueField(wireName: r'reckoningId')
  String? get reckoningId;

  @BuiltValueField(wireName: r'reckoningName')
  String? get reckoningName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'debtors')
  BuiltList<DebtorInfo>? get debtors;

  UserDebtorDebts._();

  factory UserDebtorDebts([void updates(UserDebtorDebtsBuilder b)]) = _$UserDebtorDebts;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserDebtorDebtsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDebtorDebts> get serializer => _$UserDebtorDebtsSerializer();
}

class _$UserDebtorDebtsSerializer implements PrimitiveSerializer<UserDebtorDebts> {
  @override
  final Iterable<Type> types = const [UserDebtorDebts, _$UserDebtorDebts];

  @override
  final String wireName = r'UserDebtorDebts';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserDebtorDebts object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.reckoningId != null) {
      yield r'reckoningId';
      yield serializers.serialize(
        object.reckoningId,
        specifiedType: const FullType(String),
      );
    }
    if (object.reckoningName != null) {
      yield r'reckoningName';
      yield serializers.serialize(
        object.reckoningName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.currencyCode != null) {
      yield r'currencyCode';
      yield serializers.serialize(
        object.currencyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.debtors != null) {
      yield r'debtors';
      yield serializers.serialize(
        object.debtors,
        specifiedType: const FullType.nullable(BuiltList, [FullType(DebtorInfo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserDebtorDebts object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserDebtorDebtsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'reckoningId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reckoningId = valueDes;
          break;
        case r'reckoningName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.reckoningName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        case r'debtors':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(DebtorInfo)]),
          ) as BuiltList<DebtorInfo>?;
          if (valueDes == null) continue;
          result.debtors.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserDebtorDebts deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDebtorDebtsBuilder();
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

