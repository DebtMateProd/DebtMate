//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/currency_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_all_currencies_response.g.dart';

/// GetAllCurrenciesResponse
///
/// Properties:
/// * [success] 
/// * [message] 
/// * [currencies] 
@BuiltValue()
abstract class GetAllCurrenciesResponse implements Built<GetAllCurrenciesResponse, GetAllCurrenciesResponseBuilder> {
  @BuiltValueField(wireName: r'success')
  bool? get success;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'currencies')
  BuiltList<CurrencyResponse>? get currencies;

  GetAllCurrenciesResponse._();

  factory GetAllCurrenciesResponse([void updates(GetAllCurrenciesResponseBuilder b)]) = _$GetAllCurrenciesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetAllCurrenciesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetAllCurrenciesResponse> get serializer => _$GetAllCurrenciesResponseSerializer();
}

class _$GetAllCurrenciesResponseSerializer implements PrimitiveSerializer<GetAllCurrenciesResponse> {
  @override
  final Iterable<Type> types = const [GetAllCurrenciesResponse, _$GetAllCurrenciesResponse];

  @override
  final String wireName = r'GetAllCurrenciesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetAllCurrenciesResponse object, {
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
    if (object.currencies != null) {
      yield r'currencies';
      yield serializers.serialize(
        object.currencies,
        specifiedType: const FullType.nullable(BuiltList, [FullType(CurrencyResponse)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetAllCurrenciesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetAllCurrenciesResponseBuilder result,
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
        case r'currencies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(BuiltList, [FullType(CurrencyResponse)]),
          ) as BuiltList<CurrencyResponse>?;
          if (valueDes == null) continue;
          result.currencies.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetAllCurrenciesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetAllCurrenciesResponseBuilder();
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

