// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_order_id_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentOrderIdModel {

 int get amount; int get createdAt; String get currency; String get orderId; Map<String, String> get notes; String get receipt; String get status;
/// Create a copy of PaymentOrderIdModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentOrderIdModelCopyWith<PaymentOrderIdModel> get copyWith => _$PaymentOrderIdModelCopyWithImpl<PaymentOrderIdModel>(this as PaymentOrderIdModel, _$identity);

  /// Serializes this PaymentOrderIdModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentOrderIdModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other.notes, notes)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,createdAt,currency,orderId,const DeepCollectionEquality().hash(notes),receipt,status);

@override
String toString() {
  return 'PaymentOrderIdModel(amount: $amount, createdAt: $createdAt, currency: $currency, orderId: $orderId, notes: $notes, receipt: $receipt, status: $status)';
}


}

/// @nodoc
abstract mixin class $PaymentOrderIdModelCopyWith<$Res>  {
  factory $PaymentOrderIdModelCopyWith(PaymentOrderIdModel value, $Res Function(PaymentOrderIdModel) _then) = _$PaymentOrderIdModelCopyWithImpl;
@useResult
$Res call({
 int amount, int createdAt, String currency, String orderId, Map<String, String> notes, String receipt, String status
});




}
/// @nodoc
class _$PaymentOrderIdModelCopyWithImpl<$Res>
    implements $PaymentOrderIdModelCopyWith<$Res> {
  _$PaymentOrderIdModelCopyWithImpl(this._self, this._then);

  final PaymentOrderIdModel _self;
  final $Res Function(PaymentOrderIdModel) _then;

/// Create a copy of PaymentOrderIdModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? createdAt = null,Object? currency = null,Object? orderId = null,Object? notes = null,Object? receipt = null,Object? status = null,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,receipt: null == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentOrderIdModel].
extension PaymentOrderIdModelPatterns on PaymentOrderIdModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentOrderIdModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentOrderIdModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentOrderIdModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderIdModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentOrderIdModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentOrderIdModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int amount,  int createdAt,  String currency,  String orderId,  Map<String, String> notes,  String receipt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentOrderIdModel() when $default != null:
return $default(_that.amount,_that.createdAt,_that.currency,_that.orderId,_that.notes,_that.receipt,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int amount,  int createdAt,  String currency,  String orderId,  Map<String, String> notes,  String receipt,  String status)  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderIdModel():
return $default(_that.amount,_that.createdAt,_that.currency,_that.orderId,_that.notes,_that.receipt,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int amount,  int createdAt,  String currency,  String orderId,  Map<String, String> notes,  String receipt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _PaymentOrderIdModel() when $default != null:
return $default(_that.amount,_that.createdAt,_that.currency,_that.orderId,_that.notes,_that.receipt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentOrderIdModel implements PaymentOrderIdModel {
   _PaymentOrderIdModel({required this.amount, required this.createdAt, required this.currency, required this.orderId, required final  Map<String, String> notes, required this.receipt, required this.status}): _notes = notes;
  factory _PaymentOrderIdModel.fromJson(Map<String, dynamic> json) => _$PaymentOrderIdModelFromJson(json);

@override final  int amount;
@override final  int createdAt;
@override final  String currency;
@override final  String orderId;
 final  Map<String, String> _notes;
@override Map<String, String> get notes {
  if (_notes is EqualUnmodifiableMapView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_notes);
}

@override final  String receipt;
@override final  String status;

/// Create a copy of PaymentOrderIdModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentOrderIdModelCopyWith<_PaymentOrderIdModel> get copyWith => __$PaymentOrderIdModelCopyWithImpl<_PaymentOrderIdModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentOrderIdModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentOrderIdModel&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&const DeepCollectionEquality().equals(other._notes, _notes)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,amount,createdAt,currency,orderId,const DeepCollectionEquality().hash(_notes),receipt,status);

@override
String toString() {
  return 'PaymentOrderIdModel(amount: $amount, createdAt: $createdAt, currency: $currency, orderId: $orderId, notes: $notes, receipt: $receipt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$PaymentOrderIdModelCopyWith<$Res> implements $PaymentOrderIdModelCopyWith<$Res> {
  factory _$PaymentOrderIdModelCopyWith(_PaymentOrderIdModel value, $Res Function(_PaymentOrderIdModel) _then) = __$PaymentOrderIdModelCopyWithImpl;
@override @useResult
$Res call({
 int amount, int createdAt, String currency, String orderId, Map<String, String> notes, String receipt, String status
});




}
/// @nodoc
class __$PaymentOrderIdModelCopyWithImpl<$Res>
    implements _$PaymentOrderIdModelCopyWith<$Res> {
  __$PaymentOrderIdModelCopyWithImpl(this._self, this._then);

  final _PaymentOrderIdModel _self;
  final $Res Function(_PaymentOrderIdModel) _then;

/// Create a copy of PaymentOrderIdModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? createdAt = null,Object? currency = null,Object? orderId = null,Object? notes = null,Object? receipt = null,Object? status = null,}) {
  return _then(_PaymentOrderIdModel(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as Map<String, String>,receipt: null == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
