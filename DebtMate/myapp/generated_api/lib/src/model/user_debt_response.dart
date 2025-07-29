//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_debt_response.g.dart';

/// UserDebtResponse
///
/// Properties:
/// * [reckoningId] 
/// * [reckoningName] 
/// * [description] 
/// * [owedAmount] 
/// * [isPaid] 
/// * [payerId] 
/// * [payerName] 
@BuiltValue()
abstract class UserDebtResponse implements Built<UserDebtResponse, UserDebtResponseBuilder> {
  @BuiltValueField(wireName: r'reckoningId')
  String? get reckoningId;

  @BuiltValueField(wireName: r'reckoningName')
  String? get reckoningName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'owedAmount')
  double? get owedAmount;

  @BuiltValueField(wireName: r'isPaid')
  bool? get isPaid;

  @BuiltValueField(wireName: r'payerId')
  String? get payerId;

  @BuiltValueField(wireName: r'payerName')
  String? get payerName;

  UserDebtResponse._();

  factory UserDebtResponse([void updates(UserDebtResponseBuilder b)]) = _$UserDebtResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserDebtResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserDebtResponse> get serializer => _$UserDebtResponseSerializer();
}

class _$UserDebtResponseSerializer implements PrimitiveSerializer<UserDebtResponse> {
  @override
  final Iterable<Type> types = const [UserDebtResponse, _$UserDebtResponse];

  @override
  final String wireName = r'UserDebtResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserDebtResponse object, {
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
    if (object.owedAmount != null) {
      yield r'owedAmount';
      yield serializers.serialize(
        object.owedAmount,
        specifiedType: const FullType(double),
      );
    }
    if (object.isPaid != null) {
      yield r'isPaid';
      yield serializers.serialize(
        object.isPaid,
        specifiedType: const FullType(bool),
      );
    }
    if (object.payerId != null) {
      yield r'payerId';
      yield serializers.serialize(
        object.payerId,
        specifiedType: const FullType(String),
      );
    }
    if (object.payerName != null) {
      yield r'payerName';
      yield serializers.serialize(
        object.payerName,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserDebtResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserDebtResponseBuilder result,
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
        case r'owedAmount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.owedAmount = valueDes;
          break;
        case r'isPaid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPaid = valueDes;
          break;
        case r'payerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.payerId = valueDes;
          break;
        case r'payerName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.payerName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserDebtResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserDebtResponseBuilder();
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

