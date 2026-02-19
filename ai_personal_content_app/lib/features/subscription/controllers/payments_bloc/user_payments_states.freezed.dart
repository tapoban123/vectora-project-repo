// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payments_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPaymentsStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPaymentsStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates()';
}


}

/// @nodoc
class $UserPaymentsStatesCopyWith<$Res>  {
$UserPaymentsStatesCopyWith(UserPaymentsStates _, $Res Function(UserPaymentsStates) __);
}


/// Adds pattern-matching-related methods to [UserPaymentsStates].
extension UserPaymentsStatesPatterns on UserPaymentsStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingUserPayments value)?  loadingUserPayments,TResult Function( _Success value)?  success,TResult Function( _GeneratingOrderId value)?  generatingOrderId,TResult Function( _GeneratedOrderId value)?  orderIdGenerated,TResult Function( _AllUserPayments value)?  allUserPayments,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments(_that);case _Success() when success != null:
return success(_that);case _GeneratingOrderId() when generatingOrderId != null:
return generatingOrderId(_that);case _GeneratedOrderId() when orderIdGenerated != null:
return orderIdGenerated(_that);case _AllUserPayments() when allUserPayments != null:
return allUserPayments(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingUserPayments value)  loadingUserPayments,required TResult Function( _Success value)  success,required TResult Function( _GeneratingOrderId value)  generatingOrderId,required TResult Function( _GeneratedOrderId value)  orderIdGenerated,required TResult Function( _AllUserPayments value)  allUserPayments,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingUserPayments():
return loadingUserPayments(_that);case _Success():
return success(_that);case _GeneratingOrderId():
return generatingOrderId(_that);case _GeneratedOrderId():
return orderIdGenerated(_that);case _AllUserPayments():
return allUserPayments(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingUserPayments value)?  loadingUserPayments,TResult? Function( _Success value)?  success,TResult? Function( _GeneratingOrderId value)?  generatingOrderId,TResult? Function( _GeneratedOrderId value)?  orderIdGenerated,TResult? Function( _AllUserPayments value)?  allUserPayments,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments(_that);case _Success() when success != null:
return success(_that);case _GeneratingOrderId() when generatingOrderId != null:
return generatingOrderId(_that);case _GeneratedOrderId() when orderIdGenerated != null:
return orderIdGenerated(_that);case _AllUserPayments() when allUserPayments != null:
return allUserPayments(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingUserPayments,TResult Function()?  success,TResult Function()?  generatingOrderId,TResult Function( PaymentOrderIdModel orderIdResponse)?  orderIdGenerated,TResult Function()?  allUserPayments,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments();case _Success() when success != null:
return success();case _GeneratingOrderId() when generatingOrderId != null:
return generatingOrderId();case _GeneratedOrderId() when orderIdGenerated != null:
return orderIdGenerated(_that.orderIdResponse);case _AllUserPayments() when allUserPayments != null:
return allUserPayments();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingUserPayments,required TResult Function()  success,required TResult Function()  generatingOrderId,required TResult Function( PaymentOrderIdModel orderIdResponse)  orderIdGenerated,required TResult Function()  allUserPayments,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingUserPayments():
return loadingUserPayments();case _Success():
return success();case _GeneratingOrderId():
return generatingOrderId();case _GeneratedOrderId():
return orderIdGenerated(_that.orderIdResponse);case _AllUserPayments():
return allUserPayments();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingUserPayments,TResult? Function()?  success,TResult? Function()?  generatingOrderId,TResult? Function( PaymentOrderIdModel orderIdResponse)?  orderIdGenerated,TResult? Function()?  allUserPayments,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments();case _Success() when success != null:
return success();case _GeneratingOrderId() when generatingOrderId != null:
return generatingOrderId();case _GeneratedOrderId() when orderIdGenerated != null:
return orderIdGenerated(_that.orderIdResponse);case _AllUserPayments() when allUserPayments != null:
return allUserPayments();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements UserPaymentsStates {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.initial()';
}


}




/// @nodoc


class _LoadingUserPayments implements UserPaymentsStates {
   _LoadingUserPayments();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadingUserPayments);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.loadingUserPayments()';
}


}




/// @nodoc


class _Success implements UserPaymentsStates {
   _Success();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.success()';
}


}




/// @nodoc


class _GeneratingOrderId implements UserPaymentsStates {
   _GeneratingOrderId();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratingOrderId);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.generatingOrderId()';
}


}




/// @nodoc


class _GeneratedOrderId implements UserPaymentsStates {
   _GeneratedOrderId({required this.orderIdResponse});
  

 final  PaymentOrderIdModel orderIdResponse;

/// Create a copy of UserPaymentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedOrderIdCopyWith<_GeneratedOrderId> get copyWith => __$GeneratedOrderIdCopyWithImpl<_GeneratedOrderId>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedOrderId&&(identical(other.orderIdResponse, orderIdResponse) || other.orderIdResponse == orderIdResponse));
}


@override
int get hashCode => Object.hash(runtimeType,orderIdResponse);

@override
String toString() {
  return 'UserPaymentsStates.orderIdGenerated(orderIdResponse: $orderIdResponse)';
}


}

/// @nodoc
abstract mixin class _$GeneratedOrderIdCopyWith<$Res> implements $UserPaymentsStatesCopyWith<$Res> {
  factory _$GeneratedOrderIdCopyWith(_GeneratedOrderId value, $Res Function(_GeneratedOrderId) _then) = __$GeneratedOrderIdCopyWithImpl;
@useResult
$Res call({
 PaymentOrderIdModel orderIdResponse
});


$PaymentOrderIdModelCopyWith<$Res> get orderIdResponse;

}
/// @nodoc
class __$GeneratedOrderIdCopyWithImpl<$Res>
    implements _$GeneratedOrderIdCopyWith<$Res> {
  __$GeneratedOrderIdCopyWithImpl(this._self, this._then);

  final _GeneratedOrderId _self;
  final $Res Function(_GeneratedOrderId) _then;

/// Create a copy of UserPaymentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? orderIdResponse = null,}) {
  return _then(_GeneratedOrderId(
orderIdResponse: null == orderIdResponse ? _self.orderIdResponse : orderIdResponse // ignore: cast_nullable_to_non_nullable
as PaymentOrderIdModel,
  ));
}

/// Create a copy of UserPaymentsStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentOrderIdModelCopyWith<$Res> get orderIdResponse {
  
  return $PaymentOrderIdModelCopyWith<$Res>(_self.orderIdResponse, (value) {
    return _then(_self.copyWith(orderIdResponse: value));
  });
}
}

/// @nodoc


class _AllUserPayments implements UserPaymentsStates {
   _AllUserPayments();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AllUserPayments);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.allUserPayments()';
}


}




// dart format on
