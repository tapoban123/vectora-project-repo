// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileDetails {

 String get userId; String get name; String get profilePicture; int get creationTime; String get email; SubscriptionTypes get subscriptionType; String? get paymentDate;
/// Create a copy of UserProfileDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileDetailsCopyWith<UserProfileDetails> get copyWith => _$UserProfileDetailsCopyWithImpl<UserProfileDetails>(this as UserProfileDetails, _$identity);

  /// Serializes this UserProfileDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileDetails&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.email, email) || other.email == email)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,profilePicture,creationTime,email,subscriptionType,paymentDate);

@override
String toString() {
  return 'UserProfileDetails(userId: $userId, name: $name, profilePicture: $profilePicture, creationTime: $creationTime, email: $email, subscriptionType: $subscriptionType, paymentDate: $paymentDate)';
}


}

/// @nodoc
abstract mixin class $UserProfileDetailsCopyWith<$Res>  {
  factory $UserProfileDetailsCopyWith(UserProfileDetails value, $Res Function(UserProfileDetails) _then) = _$UserProfileDetailsCopyWithImpl;
@useResult
$Res call({
 String userId, String name, String profilePicture, int creationTime, String email, SubscriptionTypes subscriptionType, String? paymentDate
});




}
/// @nodoc
class _$UserProfileDetailsCopyWithImpl<$Res>
    implements $UserProfileDetailsCopyWith<$Res> {
  _$UserProfileDetailsCopyWithImpl(this._self, this._then);

  final UserProfileDetails _self;
  final $Res Function(UserProfileDetails) _then;

/// Create a copy of UserProfileDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? profilePicture = null,Object? creationTime = null,Object? email = null,Object? subscriptionType = null,Object? paymentDate = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subscriptionType: null == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as SubscriptionTypes,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileDetails].
extension UserProfileDetailsPatterns on UserProfileDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileDetails value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileDetails value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String name,  String profilePicture,  int creationTime,  String email,  SubscriptionTypes subscriptionType,  String? paymentDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileDetails() when $default != null:
return $default(_that.userId,_that.name,_that.profilePicture,_that.creationTime,_that.email,_that.subscriptionType,_that.paymentDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String name,  String profilePicture,  int creationTime,  String email,  SubscriptionTypes subscriptionType,  String? paymentDate)  $default,) {final _that = this;
switch (_that) {
case _UserProfileDetails():
return $default(_that.userId,_that.name,_that.profilePicture,_that.creationTime,_that.email,_that.subscriptionType,_that.paymentDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String name,  String profilePicture,  int creationTime,  String email,  SubscriptionTypes subscriptionType,  String? paymentDate)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileDetails() when $default != null:
return $default(_that.userId,_that.name,_that.profilePicture,_that.creationTime,_that.email,_that.subscriptionType,_that.paymentDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileDetails implements UserProfileDetails {
   _UserProfileDetails({required this.userId, required this.name, required this.profilePicture, required this.creationTime, required this.email, required this.subscriptionType, this.paymentDate});
  factory _UserProfileDetails.fromJson(Map<String, dynamic> json) => _$UserProfileDetailsFromJson(json);

@override final  String userId;
@override final  String name;
@override final  String profilePicture;
@override final  int creationTime;
@override final  String email;
@override final  SubscriptionTypes subscriptionType;
@override final  String? paymentDate;

/// Create a copy of UserProfileDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileDetailsCopyWith<_UserProfileDetails> get copyWith => __$UserProfileDetailsCopyWithImpl<_UserProfileDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileDetails&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.profilePicture, profilePicture) || other.profilePicture == profilePicture)&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.email, email) || other.email == email)&&(identical(other.subscriptionType, subscriptionType) || other.subscriptionType == subscriptionType)&&(identical(other.paymentDate, paymentDate) || other.paymentDate == paymentDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,profilePicture,creationTime,email,subscriptionType,paymentDate);

@override
String toString() {
  return 'UserProfileDetails(userId: $userId, name: $name, profilePicture: $profilePicture, creationTime: $creationTime, email: $email, subscriptionType: $subscriptionType, paymentDate: $paymentDate)';
}


}

/// @nodoc
abstract mixin class _$UserProfileDetailsCopyWith<$Res> implements $UserProfileDetailsCopyWith<$Res> {
  factory _$UserProfileDetailsCopyWith(_UserProfileDetails value, $Res Function(_UserProfileDetails) _then) = __$UserProfileDetailsCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, String profilePicture, int creationTime, String email, SubscriptionTypes subscriptionType, String? paymentDate
});




}
/// @nodoc
class __$UserProfileDetailsCopyWithImpl<$Res>
    implements _$UserProfileDetailsCopyWith<$Res> {
  __$UserProfileDetailsCopyWithImpl(this._self, this._then);

  final _UserProfileDetails _self;
  final $Res Function(_UserProfileDetails) _then;

/// Create a copy of UserProfileDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? profilePicture = null,Object? creationTime = null,Object? email = null,Object? subscriptionType = null,Object? paymentDate = freezed,}) {
  return _then(_UserProfileDetails(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,profilePicture: null == profilePicture ? _self.profilePicture : profilePicture // ignore: cast_nullable_to_non_nullable
as String,creationTime: null == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as int,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,subscriptionType: null == subscriptionType ? _self.subscriptionType : subscriptionType // ignore: cast_nullable_to_non_nullable
as SubscriptionTypes,paymentDate: freezed == paymentDate ? _self.paymentDate : paymentDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
