//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/currency_response.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_currency_by_code_response.g.dart';

/// GetCurrencyByCodeResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [currency] 
@BuiltValue()
abstract class GetCurrencyByCodeResponse implements Built<GetCurrencyByCodeResponse, GetCurrencyByCodeResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'currency')
  CurrencyResponse? get currency;

  GetCurrencyByCodeResponse._();

  factory GetCurrencyByCodeResponse([void updates(GetCurrencyByCodeResponseBuilder b)]) = _$GetCurrencyByCodeResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetCurrencyByCodeResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetCurrencyByCodeResponse> get serializer => _$GetCurrencyByCodeResponseSerializer();
}

class _$GetCurrencyByCodeResponseSerializer implements PrimitiveSerializer<GetCurrencyByCodeResponse> {
  @override
  final Iterable<Type> types = const [GetCurrencyByCodeResponse, _$GetCurrencyByCodeResponse];

  @override
  final String wireName = r'GetCurrencyByCodeResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetCurrencyByCodeResponse object, {
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
    if (object.currency != null) {
      yield r'currency';
      yield serializers.serialize(
        object.currency,
        specifiedType: const FullType(CurrencyResponse),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetCurrencyByCodeResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetCurrencyByCodeResponseBuilder result,
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
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CurrencyResponse),
          ) as CurrencyResponse;
          result.currency.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetCurrencyByCodeResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetCurrencyByCodeResponseBuilder();
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

