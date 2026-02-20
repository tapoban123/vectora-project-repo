// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_payments_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserPaymentsEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPaymentsEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsEvents()';
}


}

/// @nodoc
class $UserPaymentsEventsCopyWith<$Res>  {
$UserPaymentsEventsCopyWith(UserPaymentsEvents _, $Res Function(UserPaymentsEvents) __);
}


/// Adds pattern-matching-related methods to [UserPaymentsEvents].
extension UserPaymentsEventsPatterns on UserPaymentsEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreatePayment value)?  createPayment,TResult Function( StartPayment value)?  startPayment,TResult Function( FetchAllUserPayments value)?  fetchAllUserPayments,TResult Function( ResetPaymentsBloc value)?  resetState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreatePayment() when createPayment != null:
return createPayment(_that);case StartPayment() when startPayment != null:
return startPayment(_that);case FetchAllUserPayments() when fetchAllUserPayments != null:
return fetchAllUserPayments(_that);case ResetPaymentsBloc() when resetState != null:
return resetState(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreatePayment value)  createPayment,required TResult Function( StartPayment value)  startPayment,required TResult Function( FetchAllUserPayments value)  fetchAllUserPayments,required TResult Function( ResetPaymentsBloc value)  resetState,}){
final _that = this;
switch (_that) {
case CreatePayment():
return createPayment(_that);case StartPayment():
return startPayment(_that);case FetchAllUserPayments():
return fetchAllUserPayments(_that);case ResetPaymentsBloc():
return resetState(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreatePayment value)?  createPayment,TResult? Function( StartPayment value)?  startPayment,TResult? Function( FetchAllUserPayments value)?  fetchAllUserPayments,TResult? Function( ResetPaymentsBloc value)?  resetState,}){
final _that = this;
switch (_that) {
case CreatePayment() when createPayment != null:
return createPayment(_that);case StartPayment() when startPayment != null:
return startPayment(_that);case FetchAllUserPayments() when fetchAllUserPayments != null:
return fetchAllUserPayments(_that);case ResetPaymentsBloc() when resetState != null:
return resetState(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  createPayment,TResult Function( Razorpay razorpay)?  startPayment,TResult Function()?  fetchAllUserPayments,TResult Function()?  resetState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreatePayment() when createPayment != null:
return createPayment();case StartPayment() when startPayment != null:
return startPayment(_that.razorpay);case FetchAllUserPayments() when fetchAllUserPayments != null:
return fetchAllUserPayments();case ResetPaymentsBloc() when resetState != null:
return resetState();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  createPayment,required TResult Function( Razorpay razorpay)  startPayment,required TResult Function()  fetchAllUserPayments,required TResult Function()  resetState,}) {final _that = this;
switch (_that) {
case CreatePayment():
return createPayment();case StartPayment():
return startPayment(_that.razorpay);case FetchAllUserPayments():
return fetchAllUserPayments();case ResetPaymentsBloc():
return resetState();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  createPayment,TResult? Function( Razorpay razorpay)?  startPayment,TResult? Function()?  fetchAllUserPayments,TResult? Function()?  resetState,}) {final _that = this;
switch (_that) {
case CreatePayment() when createPayment != null:
return createPayment();case StartPayment() when startPayment != null:
return startPayment(_that.razorpay);case FetchAllUserPayments() when fetchAllUserPayments != null:
return fetchAllUserPayments();case ResetPaymentsBloc() when resetState != null:
return resetState();case _:
  return null;

}
}

}

/// @nodoc


class CreatePayment implements UserPaymentsEvents {
   CreatePayment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePayment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsEvents.createPayment()';
}


}




/// @nodoc


class StartPayment implements UserPaymentsEvents {
   StartPayment({required this.razorpay});
  

 final  Razorpay razorpay;

/// Create a copy of UserPaymentsEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartPaymentCopyWith<StartPayment> get copyWith => _$StartPaymentCopyWithImpl<StartPayment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartPayment&&(identical(other.razorpay, razorpay) || other.razorpay == razorpay));
}


@override
int get hashCode => Object.hash(runtimeType,razorpay);

@override
String toString() {
  return 'UserPaymentsEvents.startPayment(razorpay: $razorpay)';
}


}

/// @nodoc
abstract mixin class $StartPaymentCopyWith<$Res> implements $UserPaymentsEventsCopyWith<$Res> {
  factory $StartPaymentCopyWith(StartPayment value, $Res Function(StartPayment) _then) = _$StartPaymentCopyWithImpl;
@useResult
$Res call({
 Razorpay razorpay
});




}
/// @nodoc
class _$StartPaymentCopyWithImpl<$Res>
    implements $StartPaymentCopyWith<$Res> {
  _$StartPaymentCopyWithImpl(this._self, this._then);

  final StartPayment _self;
  final $Res Function(StartPayment) _then;

/// Create a copy of UserPaymentsEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? razorpay = null,}) {
  return _then(StartPayment(
razorpay: null == razorpay ? _self.razorpay : razorpay // ignore: cast_nullable_to_non_nullable
as Razorpay,
  ));
}


}

/// @nodoc


class FetchAllUserPayments implements UserPaymentsEvents {
   FetchAllUserPayments();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllUserPayments);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsEvents.fetchAllUserPayments()';
}


}




/// @nodoc


class ResetPaymentsBloc implements UserPaymentsEvents {
   ResetPaymentsBloc();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPaymentsBloc);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsEvents.resetState()';
}


}




// dart format on
