//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/user_debt.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_reckoning_request.g.dart';

/// UpdateReckoningRequest
///
/// Properties:
/// * [reckoningId] 
/// * [name] 
/// * [description] 
/// * [totalCost] 
/// * [payerId] 
/// * [currencyCode] 
/// * [debts] 
@BuiltValue()
abstract class UpdateReckoningRequest implements Built<UpdateReckoningRequest, UpdateReckoningRequestBuilder> {
  @BuiltValueField(wireName: r'reckoningId')
  String? get reckoningId;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'totalCost')
  double? get totalCost;

  @BuiltValueField(wireName: r'payerId')
  String? get payerId;

  @BuiltValueField(wireName: r'currencyCode')
  String? get currencyCode;

  @BuiltValueField(wireName: r'debts')
  BuiltList<UserDebt>? get debts;

  UpdateReckoningRequest._();

  factory UpdateReckoningRequest([void updates(UpdateReckoningRequestBuilder b)]) = _$UpdateReckoningRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateReckoningRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateReckoningRequest> get serializer => _$UpdateReckoningRequestSerializer();
}

class _$UpdateReckoningRequestSerializer implements PrimitiveSerializer<UpdateReckoningRequest> {
  @override
  final Iterable<Type> types = const [UpdateReckoningRequest, _$UpdateReckoningRequest];

  @override
  final String wireName = r'UpdateReckoningRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateReckoningRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.reckoningId != null) {
      yield r'reckoningId';
      yield serializers.serialize(
        object.reckoningId,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
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
    if (object.totalCost != null) {
      yield r'totalCost';
      yield serializers.serialize(
        object.totalCost,
        specifiedType: const FullType.nullable(double),
      );
    }
    if (object.payerId != null) {
      yield r'payerId';
      yield serializers.serialize(
        object.payerId,
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
    if (object.debts != null) {
      yield r'debts';
      yield serializers.serialize(
        object.debts,
        specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebt)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateReckoningRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateReckoningRequestBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'totalCost':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.totalCost = valueDes;
          break;
        case r'payerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.payerId = valueDes;
          break;
        case r'currencyCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.currencyCode = valueDes;
          break;
        case r'debts':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(UserDebt)]),
          ) as BuiltList<UserDebt>?;
          if (valueDes == null) continue;
          result.debts.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateReckoningRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateReckoningRequestBuilder();
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

