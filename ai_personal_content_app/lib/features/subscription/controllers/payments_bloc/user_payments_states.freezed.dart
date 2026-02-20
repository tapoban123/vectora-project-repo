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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _LoadingUserPayments value)?  loadingUserPayments,TResult Function( _PaymentStarted value)?  paymentStarted,TResult Function( _PaymentInitiated value)?  paymentInitiated,TResult Function( _AllUserPayments value)?  allUserPayments,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments(_that);case _PaymentStarted() when paymentStarted != null:
return paymentStarted(_that);case _PaymentInitiated() when paymentInitiated != null:
return paymentInitiated(_that);case _AllUserPayments() when allUserPayments != null:
return allUserPayments(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _LoadingUserPayments value)  loadingUserPayments,required TResult Function( _PaymentStarted value)  paymentStarted,required TResult Function( _PaymentInitiated value)  paymentInitiated,required TResult Function( _AllUserPayments value)  allUserPayments,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _LoadingUserPayments():
return loadingUserPayments(_that);case _PaymentStarted():
return paymentStarted(_that);case _PaymentInitiated():
return paymentInitiated(_that);case _AllUserPayments():
return allUserPayments(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _LoadingUserPayments value)?  loadingUserPayments,TResult? Function( _PaymentStarted value)?  paymentStarted,TResult? Function( _PaymentInitiated value)?  paymentInitiated,TResult? Function( _AllUserPayments value)?  allUserPayments,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments(_that);case _PaymentStarted() when paymentStarted != null:
return paymentStarted(_that);case _PaymentInitiated() when paymentInitiated != null:
return paymentInitiated(_that);case _AllUserPayments() when allUserPayments != null:
return allUserPayments(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadingUserPayments,TResult Function()?  paymentStarted,TResult Function()?  paymentInitiated,TResult Function()?  allUserPayments,TResult Function( ApiException exception)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments();case _PaymentStarted() when paymentStarted != null:
return paymentStarted();case _PaymentInitiated() when paymentInitiated != null:
return paymentInitiated();case _AllUserPayments() when allUserPayments != null:
return allUserPayments();case _Error() when error != null:
return error(_that.exception);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadingUserPayments,required TResult Function()  paymentStarted,required TResult Function()  paymentInitiated,required TResult Function()  allUserPayments,required TResult Function( ApiException exception)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _LoadingUserPayments():
return loadingUserPayments();case _PaymentStarted():
return paymentStarted();case _PaymentInitiated():
return paymentInitiated();case _AllUserPayments():
return allUserPayments();case _Error():
return error(_that.exception);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadingUserPayments,TResult? Function()?  paymentStarted,TResult? Function()?  paymentInitiated,TResult? Function()?  allUserPayments,TResult? Function( ApiException exception)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _LoadingUserPayments() when loadingUserPayments != null:
return loadingUserPayments();case _PaymentStarted() when paymentStarted != null:
return paymentStarted();case _PaymentInitiated() when paymentInitiated != null:
return paymentInitiated();case _AllUserPayments() when allUserPayments != null:
return allUserPayments();case _Error() when error != null:
return error(_that.exception);case _:
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


class _PaymentStarted implements UserPaymentsStates {
   _PaymentStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.paymentStarted()';
}


}




/// @nodoc


class _PaymentInitiated implements UserPaymentsStates {
   _PaymentInitiated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentInitiated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserPaymentsStates.paymentInitiated()';
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




/// @nodoc


class _Error implements UserPaymentsStates {
   _Error({required this.exception});
  

 final  ApiException exception;

/// Create a copy of UserPaymentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.exception, exception) || other.exception == exception));
}


@override
int get hashCode => Object.hash(runtimeType,exception);

@override
String toString() {
  return 'UserPaymentsStates.error(exception: $exception)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $UserPaymentsStatesCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiException exception
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of UserPaymentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = null,}) {
  return _then(_Error(
exception: null == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as ApiException,
  ));
}


}

// dart format on
