// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_credits_and_quotas_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCreditsAndQuotasModel {

 String get id; String get userId; int get remainingAdsQuotaForToday; int get remainingCredits; int? get lastAdWatchTime; int? get lastCreditUseTime;
/// Create a copy of UserCreditsAndQuotasModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCreditsAndQuotasModelCopyWith<UserCreditsAndQuotasModel> get copyWith => _$UserCreditsAndQuotasModelCopyWithImpl<UserCreditsAndQuotasModel>(this as UserCreditsAndQuotasModel, _$identity);

  /// Serializes this UserCreditsAndQuotasModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserCreditsAndQuotasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.remainingAdsQuotaForToday, remainingAdsQuotaForToday) || other.remainingAdsQuotaForToday == remainingAdsQuotaForToday)&&(identical(other.remainingCredits, remainingCredits) || other.remainingCredits == remainingCredits)&&(identical(other.lastAdWatchTime, lastAdWatchTime) || other.lastAdWatchTime == lastAdWatchTime)&&(identical(other.lastCreditUseTime, lastCreditUseTime) || other.lastCreditUseTime == lastCreditUseTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,remainingAdsQuotaForToday,remainingCredits,lastAdWatchTime,lastCreditUseTime);

@override
String toString() {
  return 'UserCreditsAndQuotasModel(id: $id, userId: $userId, remainingAdsQuotaForToday: $remainingAdsQuotaForToday, remainingCredits: $remainingCredits, lastAdWatchTime: $lastAdWatchTime, lastCreditUseTime: $lastCreditUseTime)';
}


}

/// @nodoc
abstract mixin class $UserCreditsAndQuotasModelCopyWith<$Res>  {
  factory $UserCreditsAndQuotasModelCopyWith(UserCreditsAndQuotasModel value, $Res Function(UserCreditsAndQuotasModel) _then) = _$UserCreditsAndQuotasModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, int remainingAdsQuotaForToday, int remainingCredits, int? lastAdWatchTime, int? lastCreditUseTime
});




}
/// @nodoc
class _$UserCreditsAndQuotasModelCopyWithImpl<$Res>
    implements $UserCreditsAndQuotasModelCopyWith<$Res> {
  _$UserCreditsAndQuotasModelCopyWithImpl(this._self, this._then);

  final UserCreditsAndQuotasModel _self;
  final $Res Function(UserCreditsAndQuotasModel) _then;

/// Create a copy of UserCreditsAndQuotasModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? remainingAdsQuotaForToday = null,Object? remainingCredits = null,Object? lastAdWatchTime = freezed,Object? lastCreditUseTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,remainingAdsQuotaForToday: null == remainingAdsQuotaForToday ? _self.remainingAdsQuotaForToday : remainingAdsQuotaForToday // ignore: cast_nullable_to_non_nullable
as int,remainingCredits: null == remainingCredits ? _self.remainingCredits : remainingCredits // ignore: cast_nullable_to_non_nullable
as int,lastAdWatchTime: freezed == lastAdWatchTime ? _self.lastAdWatchTime : lastAdWatchTime // ignore: cast_nullable_to_non_nullable
as int?,lastCreditUseTime: freezed == lastCreditUseTime ? _self.lastCreditUseTime : lastCreditUseTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserCreditsAndQuotasModel].
extension UserCreditsAndQuotasModelPatterns on UserCreditsAndQuotasModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserCreditsAndQuotasModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserCreditsAndQuotasModel value)  $default,){
final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserCreditsAndQuotasModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  int remainingAdsQuotaForToday,  int remainingCredits,  int? lastAdWatchTime,  int? lastCreditUseTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel() when $default != null:
return $default(_that.id,_that.userId,_that.remainingAdsQuotaForToday,_that.remainingCredits,_that.lastAdWatchTime,_that.lastCreditUseTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  int remainingAdsQuotaForToday,  int remainingCredits,  int? lastAdWatchTime,  int? lastCreditUseTime)  $default,) {final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel():
return $default(_that.id,_that.userId,_that.remainingAdsQuotaForToday,_that.remainingCredits,_that.lastAdWatchTime,_that.lastCreditUseTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  int remainingAdsQuotaForToday,  int remainingCredits,  int? lastAdWatchTime,  int? lastCreditUseTime)?  $default,) {final _that = this;
switch (_that) {
case _UserCreditsAndQuotasModel() when $default != null:
return $default(_that.id,_that.userId,_that.remainingAdsQuotaForToday,_that.remainingCredits,_that.lastAdWatchTime,_that.lastCreditUseTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserCreditsAndQuotasModel implements UserCreditsAndQuotasModel {
   _UserCreditsAndQuotasModel({required this.id, required this.userId, required this.remainingAdsQuotaForToday, required this.remainingCredits, this.lastAdWatchTime, this.lastCreditUseTime});
  factory _UserCreditsAndQuotasModel.fromJson(Map<String, dynamic> json) => _$UserCreditsAndQuotasModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  int remainingAdsQuotaForToday;
@override final  int remainingCredits;
@override final  int? lastAdWatchTime;
@override final  int? lastCreditUseTime;

/// Create a copy of UserCreditsAndQuotasModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCreditsAndQuotasModelCopyWith<_UserCreditsAndQuotasModel> get copyWith => __$UserCreditsAndQuotasModelCopyWithImpl<_UserCreditsAndQuotasModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserCreditsAndQuotasModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserCreditsAndQuotasModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.remainingAdsQuotaForToday, remainingAdsQuotaForToday) || other.remainingAdsQuotaForToday == remainingAdsQuotaForToday)&&(identical(other.remainingCredits, remainingCredits) || other.remainingCredits == remainingCredits)&&(identical(other.lastAdWatchTime, lastAdWatchTime) || other.lastAdWatchTime == lastAdWatchTime)&&(identical(other.lastCreditUseTime, lastCreditUseTime) || other.lastCreditUseTime == lastCreditUseTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,remainingAdsQuotaForToday,remainingCredits,lastAdWatchTime,lastCreditUseTime);

@override
String toString() {
  return 'UserCreditsAndQuotasModel(id: $id, userId: $userId, remainingAdsQuotaForToday: $remainingAdsQuotaForToday, remainingCredits: $remainingCredits, lastAdWatchTime: $lastAdWatchTime, lastCreditUseTime: $lastCreditUseTime)';
}


}

/// @nodoc
abstract mixin class _$UserCreditsAndQuotasModelCopyWith<$Res> implements $UserCreditsAndQuotasModelCopyWith<$Res> {
  factory _$UserCreditsAndQuotasModelCopyWith(_UserCreditsAndQuotasModel value, $Res Function(_UserCreditsAndQuotasModel) _then) = __$UserCreditsAndQuotasModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, int remainingAdsQuotaForToday, int remainingCredits, int? lastAdWatchTime, int? lastCreditUseTime
});




}
/// @nodoc
class __$UserCreditsAndQuotasModelCopyWithImpl<$Res>
    implements _$UserCreditsAndQuotasModelCopyWith<$Res> {
  __$UserCreditsAndQuotasModelCopyWithImpl(this._self, this._then);

  final _UserCreditsAndQuotasModel _self;
  final $Res Function(_UserCreditsAndQuotasModel) _then;

/// Create a copy of UserCreditsAndQuotasModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? remainingAdsQuotaForToday = null,Object? remainingCredits = null,Object? lastAdWatchTime = freezed,Object? lastCreditUseTime = freezed,}) {
  return _then(_UserCreditsAndQuotasModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,remainingAdsQuotaForToday: null == remainingAdsQuotaForToday ? _self.remainingAdsQuotaForToday : remainingAdsQuotaForToday // ignore: cast_nullable_to_non_nullable
as int,remainingCredits: null == remainingCredits ? _self.remainingCredits : remainingCredits // ignore: cast_nullable_to_non_nullable
as int,lastAdWatchTime: freezed == lastAdWatchTime ? _self.lastAdWatchTime : lastAdWatchTime // ignore: cast_nullable_to_non_nullable
as int?,lastCreditUseTime: freezed == lastCreditUseTime ? _self.lastCreditUseTime : lastCreditUseTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
