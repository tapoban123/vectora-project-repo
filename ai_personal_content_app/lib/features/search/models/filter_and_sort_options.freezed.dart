// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_and_sort_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterAndSortOptions {

 List<FilterFileType>? get fileType; bool? get pinnedOnly; FilterTime? get time; SortOption? get sortOption;
/// Create a copy of FilterAndSortOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterAndSortOptionsCopyWith<FilterAndSortOptions> get copyWith => _$FilterAndSortOptionsCopyWithImpl<FilterAndSortOptions>(this as FilterAndSortOptions, _$identity);

  /// Serializes this FilterAndSortOptions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterAndSortOptions&&const DeepCollectionEquality().equals(other.fileType, fileType)&&(identical(other.pinnedOnly, pinnedOnly) || other.pinnedOnly == pinnedOnly)&&(identical(other.time, time) || other.time == time)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fileType),pinnedOnly,time,sortOption);

@override
String toString() {
  return 'FilterAndSortOptions(fileType: $fileType, pinnedOnly: $pinnedOnly, time: $time, sortOption: $sortOption)';
}


}

/// @nodoc
abstract mixin class $FilterAndSortOptionsCopyWith<$Res>  {
  factory $FilterAndSortOptionsCopyWith(FilterAndSortOptions value, $Res Function(FilterAndSortOptions) _then) = _$FilterAndSortOptionsCopyWithImpl;
@useResult
$Res call({
 List<FilterFileType>? fileType, bool? pinnedOnly, FilterTime? time, SortOption? sortOption
});




}
/// @nodoc
class _$FilterAndSortOptionsCopyWithImpl<$Res>
    implements $FilterAndSortOptionsCopyWith<$Res> {
  _$FilterAndSortOptionsCopyWithImpl(this._self, this._then);

  final FilterAndSortOptions _self;
  final $Res Function(FilterAndSortOptions) _then;

/// Create a copy of FilterAndSortOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fileType = freezed,Object? pinnedOnly = freezed,Object? time = freezed,Object? sortOption = freezed,}) {
  return _then(_self.copyWith(
fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as List<FilterFileType>?,pinnedOnly: freezed == pinnedOnly ? _self.pinnedOnly : pinnedOnly // ignore: cast_nullable_to_non_nullable
as bool?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as FilterTime?,sortOption: freezed == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as SortOption?,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterAndSortOptions].
extension FilterAndSortOptionsPatterns on FilterAndSortOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterAndSortOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterAndSortOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterAndSortOptions value)  $default,){
final _that = this;
switch (_that) {
case _FilterAndSortOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterAndSortOptions value)?  $default,){
final _that = this;
switch (_that) {
case _FilterAndSortOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FilterFileType>? fileType,  bool? pinnedOnly,  FilterTime? time,  SortOption? sortOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterAndSortOptions() when $default != null:
return $default(_that.fileType,_that.pinnedOnly,_that.time,_that.sortOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FilterFileType>? fileType,  bool? pinnedOnly,  FilterTime? time,  SortOption? sortOption)  $default,) {final _that = this;
switch (_that) {
case _FilterAndSortOptions():
return $default(_that.fileType,_that.pinnedOnly,_that.time,_that.sortOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FilterFileType>? fileType,  bool? pinnedOnly,  FilterTime? time,  SortOption? sortOption)?  $default,) {final _that = this;
switch (_that) {
case _FilterAndSortOptions() when $default != null:
return $default(_that.fileType,_that.pinnedOnly,_that.time,_that.sortOption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilterAndSortOptions implements FilterAndSortOptions {
   _FilterAndSortOptions({final  List<FilterFileType>? fileType, this.pinnedOnly, this.time, this.sortOption}): _fileType = fileType;
  factory _FilterAndSortOptions.fromJson(Map<String, dynamic> json) => _$FilterAndSortOptionsFromJson(json);

 final  List<FilterFileType>? _fileType;
@override List<FilterFileType>? get fileType {
  final value = _fileType;
  if (value == null) return null;
  if (_fileType is EqualUnmodifiableListView) return _fileType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? pinnedOnly;
@override final  FilterTime? time;
@override final  SortOption? sortOption;

/// Create a copy of FilterAndSortOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterAndSortOptionsCopyWith<_FilterAndSortOptions> get copyWith => __$FilterAndSortOptionsCopyWithImpl<_FilterAndSortOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterAndSortOptionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterAndSortOptions&&const DeepCollectionEquality().equals(other._fileType, _fileType)&&(identical(other.pinnedOnly, pinnedOnly) || other.pinnedOnly == pinnedOnly)&&(identical(other.time, time) || other.time == time)&&(identical(other.sortOption, sortOption) || other.sortOption == sortOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_fileType),pinnedOnly,time,sortOption);

@override
String toString() {
  return 'FilterAndSortOptions(fileType: $fileType, pinnedOnly: $pinnedOnly, time: $time, sortOption: $sortOption)';
}


}

/// @nodoc
abstract mixin class _$FilterAndSortOptionsCopyWith<$Res> implements $FilterAndSortOptionsCopyWith<$Res> {
  factory _$FilterAndSortOptionsCopyWith(_FilterAndSortOptions value, $Res Function(_FilterAndSortOptions) _then) = __$FilterAndSortOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<FilterFileType>? fileType, bool? pinnedOnly, FilterTime? time, SortOption? sortOption
});




}
/// @nodoc
class __$FilterAndSortOptionsCopyWithImpl<$Res>
    implements _$FilterAndSortOptionsCopyWith<$Res> {
  __$FilterAndSortOptionsCopyWithImpl(this._self, this._then);

  final _FilterAndSortOptions _self;
  final $Res Function(_FilterAndSortOptions) _then;

/// Create a copy of FilterAndSortOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fileType = freezed,Object? pinnedOnly = freezed,Object? time = freezed,Object? sortOption = freezed,}) {
  return _then(_FilterAndSortOptions(
fileType: freezed == fileType ? _self._fileType : fileType // ignore: cast_nullable_to_non_nullable
as List<FilterFileType>?,pinnedOnly: freezed == pinnedOnly ? _self.pinnedOnly : pinnedOnly // ignore: cast_nullable_to_non_nullable
as bool?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as FilterTime?,sortOption: freezed == sortOption ? _self.sortOption : sortOption // ignore: cast_nullable_to_non_nullable
as SortOption?,
  ));
}


}

// dart format on
