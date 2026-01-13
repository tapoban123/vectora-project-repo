// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contents_manager_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ContentsManagerEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentsManagerEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ContentsManagerEvents()';
}


}

/// @nodoc
class $ContentsManagerEventsCopyWith<$Res>  {
$ContentsManagerEventsCopyWith(ContentsManagerEvents _, $Res Function(ContentsManagerEvents) __);
}


/// Adds pattern-matching-related methods to [ContentsManagerEvents].
extension ContentsManagerEventsPatterns on ContentsManagerEvents {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FetchAllContents value)?  fetchAllContents,TResult Function( RemoveContent value)?  removeContent,TResult Function( RemoveMultipleContent value)?  removeMultipleContent,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FetchAllContents() when fetchAllContents != null:
return fetchAllContents(_that);case RemoveContent() when removeContent != null:
return removeContent(_that);case RemoveMultipleContent() when removeMultipleContent != null:
return removeMultipleContent(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FetchAllContents value)  fetchAllContents,required TResult Function( RemoveContent value)  removeContent,required TResult Function( RemoveMultipleContent value)  removeMultipleContent,}){
final _that = this;
switch (_that) {
case FetchAllContents():
return fetchAllContents(_that);case RemoveContent():
return removeContent(_that);case RemoveMultipleContent():
return removeMultipleContent(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FetchAllContents value)?  fetchAllContents,TResult? Function( RemoveContent value)?  removeContent,TResult? Function( RemoveMultipleContent value)?  removeMultipleContent,}){
final _that = this;
switch (_that) {
case FetchAllContents() when fetchAllContents != null:
return fetchAllContents(_that);case RemoveContent() when removeContent != null:
return removeContent(_that);case RemoveMultipleContent() when removeMultipleContent != null:
return removeMultipleContent(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FilterAndSortOptions? filterAndSortOptions)?  fetchAllContents,TResult Function( int objectBoxId,  String cid)?  removeContent,TResult Function( List<int> ids)?  removeMultipleContent,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FetchAllContents() when fetchAllContents != null:
return fetchAllContents(_that.filterAndSortOptions);case RemoveContent() when removeContent != null:
return removeContent(_that.objectBoxId,_that.cid);case RemoveMultipleContent() when removeMultipleContent != null:
return removeMultipleContent(_that.ids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FilterAndSortOptions? filterAndSortOptions)  fetchAllContents,required TResult Function( int objectBoxId,  String cid)  removeContent,required TResult Function( List<int> ids)  removeMultipleContent,}) {final _that = this;
switch (_that) {
case FetchAllContents():
return fetchAllContents(_that.filterAndSortOptions);case RemoveContent():
return removeContent(_that.objectBoxId,_that.cid);case RemoveMultipleContent():
return removeMultipleContent(_that.ids);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FilterAndSortOptions? filterAndSortOptions)?  fetchAllContents,TResult? Function( int objectBoxId,  String cid)?  removeContent,TResult? Function( List<int> ids)?  removeMultipleContent,}) {final _that = this;
switch (_that) {
case FetchAllContents() when fetchAllContents != null:
return fetchAllContents(_that.filterAndSortOptions);case RemoveContent() when removeContent != null:
return removeContent(_that.objectBoxId,_that.cid);case RemoveMultipleContent() when removeMultipleContent != null:
return removeMultipleContent(_that.ids);case _:
  return null;

}
}

}

/// @nodoc


class FetchAllContents implements ContentsManagerEvents {
   FetchAllContents({this.filterAndSortOptions});
  

 final  FilterAndSortOptions? filterAndSortOptions;

/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FetchAllContentsCopyWith<FetchAllContents> get copyWith => _$FetchAllContentsCopyWithImpl<FetchAllContents>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FetchAllContents&&(identical(other.filterAndSortOptions, filterAndSortOptions) || other.filterAndSortOptions == filterAndSortOptions));
}


@override
int get hashCode => Object.hash(runtimeType,filterAndSortOptions);

@override
String toString() {
  return 'ContentsManagerEvents.fetchAllContents(filterAndSortOptions: $filterAndSortOptions)';
}


}

/// @nodoc
abstract mixin class $FetchAllContentsCopyWith<$Res> implements $ContentsManagerEventsCopyWith<$Res> {
  factory $FetchAllContentsCopyWith(FetchAllContents value, $Res Function(FetchAllContents) _then) = _$FetchAllContentsCopyWithImpl;
@useResult
$Res call({
 FilterAndSortOptions? filterAndSortOptions
});




}
/// @nodoc
class _$FetchAllContentsCopyWithImpl<$Res>
    implements $FetchAllContentsCopyWith<$Res> {
  _$FetchAllContentsCopyWithImpl(this._self, this._then);

  final FetchAllContents _self;
  final $Res Function(FetchAllContents) _then;

/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filterAndSortOptions = freezed,}) {
  return _then(FetchAllContents(
filterAndSortOptions: freezed == filterAndSortOptions ? _self.filterAndSortOptions : filterAndSortOptions // ignore: cast_nullable_to_non_nullable
as FilterAndSortOptions?,
  ));
}


}

/// @nodoc


class RemoveContent implements ContentsManagerEvents {
   RemoveContent({required this.objectBoxId, required this.cid});
  

 final  int objectBoxId;
 final  String cid;

/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveContentCopyWith<RemoveContent> get copyWith => _$RemoveContentCopyWithImpl<RemoveContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveContent&&(identical(other.objectBoxId, objectBoxId) || other.objectBoxId == objectBoxId)&&(identical(other.cid, cid) || other.cid == cid));
}


@override
int get hashCode => Object.hash(runtimeType,objectBoxId,cid);

@override
String toString() {
  return 'ContentsManagerEvents.removeContent(objectBoxId: $objectBoxId, cid: $cid)';
}


}

/// @nodoc
abstract mixin class $RemoveContentCopyWith<$Res> implements $ContentsManagerEventsCopyWith<$Res> {
  factory $RemoveContentCopyWith(RemoveContent value, $Res Function(RemoveContent) _then) = _$RemoveContentCopyWithImpl;
@useResult
$Res call({
 int objectBoxId, String cid
});




}
/// @nodoc
class _$RemoveContentCopyWithImpl<$Res>
    implements $RemoveContentCopyWith<$Res> {
  _$RemoveContentCopyWithImpl(this._self, this._then);

  final RemoveContent _self;
  final $Res Function(RemoveContent) _then;

/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? objectBoxId = null,Object? cid = null,}) {
  return _then(RemoveContent(
objectBoxId: null == objectBoxId ? _self.objectBoxId : objectBoxId // ignore: cast_nullable_to_non_nullable
as int,cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RemoveMultipleContent implements ContentsManagerEvents {
   RemoveMultipleContent({required final  List<int> ids}): _ids = ids;
  

 final  List<int> _ids;
 List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoveMultipleContentCopyWith<RemoveMultipleContent> get copyWith => _$RemoveMultipleContentCopyWithImpl<RemoveMultipleContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoveMultipleContent&&const DeepCollectionEquality().equals(other._ids, _ids));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'ContentsManagerEvents.removeMultipleContent(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $RemoveMultipleContentCopyWith<$Res> implements $ContentsManagerEventsCopyWith<$Res> {
  factory $RemoveMultipleContentCopyWith(RemoveMultipleContent value, $Res Function(RemoveMultipleContent) _then) = _$RemoveMultipleContentCopyWithImpl;
@useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class _$RemoveMultipleContentCopyWithImpl<$Res>
    implements $RemoveMultipleContentCopyWith<$Res> {
  _$RemoveMultipleContentCopyWithImpl(this._self, this._then);

  final RemoveMultipleContent _self;
  final $Res Function(RemoveMultipleContent) _then;

/// Create a copy of ContentsManagerEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(RemoveMultipleContent(
ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
