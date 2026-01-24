// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_auth_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserAuthEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAuthEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAuthEvents()';
}


}

/// @nodoc
class $UserAuthEventsCopyWith<$Res>  {
$UserAuthEventsCopyWith(UserAuthEvents _, $Res Function(UserAuthEvents) __);
}


/// Adds pattern-matching-related methods to [UserAuthEvents].
extension UserAuthEventsPatterns on UserAuthEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SignIn value)?  signIn,TResult Function( SignOut value)?  signOut,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SignIn() when signIn != null:
return signIn(_that);case SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SignIn value)  signIn,required TResult Function( SignOut value)  signOut,}){
final _that = this;
switch (_that) {
case SignIn():
return signIn(_that);case SignOut():
return signOut(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SignIn value)?  signIn,TResult? Function( SignOut value)?  signOut,}){
final _that = this;
switch (_that) {
case SignIn() when signIn != null:
return signIn(_that);case SignOut() when signOut != null:
return signOut(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  signIn,TResult Function()?  signOut,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SignIn() when signIn != null:
return signIn();case SignOut() when signOut != null:
return signOut();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  signIn,required TResult Function()  signOut,}) {final _that = this;
switch (_that) {
case SignIn():
return signIn();case SignOut():
return signOut();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  signIn,TResult? Function()?  signOut,}) {final _that = this;
switch (_that) {
case SignIn() when signIn != null:
return signIn();case SignOut() when signOut != null:
return signOut();case _:
  return null;

}
}

}

/// @nodoc


class SignIn implements UserAuthEvents {
   SignIn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignIn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAuthEvents.signIn()';
}


}




/// @nodoc


class SignOut implements UserAuthEvents {
   SignOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'UserAuthEvents.signOut()';
}


}




// dart format on
