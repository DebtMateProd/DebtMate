//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/user_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'debtor_info.g.dart';

/// DebtorInfo
///
/// Properties:
/// * [debtor] 
/// * [owedAmount] 
/// * [isPaid] 
@BuiltValue()
abstract class DebtorInfo implements Built<DebtorInfo, DebtorInfoBuilder> {
  @BuiltValueField(wireName: r'debtor')
  UserResponse? get debtor;

  @BuiltValueField(wireName: r'owedAmount')
  double? get owedAmount;

  @BuiltValueField(wireName: r'isPaid')
  bool? get isPaid;

  DebtorInfo._();

  factory DebtorInfo([void updates(DebtorInfoBuilder b)]) = _$DebtorInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DebtorInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DebtorInfo> get serializer => _$DebtorInfoSerializer();
}

class _$DebtorInfoSerializer implements PrimitiveSerializer<DebtorInfo> {
  @override
  final Iterable<Type> types = const [DebtorInfo, _$DebtorInfo];

  @override
  final String wireName = r'DebtorInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DebtorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.debtor != null) {
      yield r'debtor';
      yield serializers.serialize(
        object.debtor,
        specifiedType: const FullType(UserResponse),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    DebtorInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DebtorInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'debtor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(UserResponse),
          ) as UserResponse;
          result.debtor.replace(valueDes);
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DebtorInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DebtorInfoBuilder();
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

