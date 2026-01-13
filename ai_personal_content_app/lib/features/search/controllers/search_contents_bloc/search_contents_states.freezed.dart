// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_contents_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchContentsStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchContentsStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchContentsStates()';
}


}

/// @nodoc
class $SearchContentsStatesCopyWith<$Res>  {
$SearchContentsStatesCopyWith(SearchContentsStates _, $Res Function(SearchContentsStates) __);
}


/// Adds pattern-matching-related methods to [SearchContentsStates].
extension SearchContentsStatesPatterns on SearchContentsStates {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _EmbeddingsGenerated value)?  embeddingsGenerated,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _EmbeddingsGenerated() when embeddingsGenerated != null:
return embeddingsGenerated(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _EmbeddingsGenerated value)  embeddingsGenerated,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _EmbeddingsGenerated():
return embeddingsGenerated(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _EmbeddingsGenerated value)?  embeddingsGenerated,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _EmbeddingsGenerated() when embeddingsGenerated != null:
return embeddingsGenerated(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<ContentWithScroreModel> images,  List<ContentWithScroreModel> documents,  List<ContentWithScroreModel> notes)?  embeddingsGenerated,TResult Function( String message,  int? statusCode)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _EmbeddingsGenerated() when embeddingsGenerated != null:
return embeddingsGenerated(_that.images,_that.documents,_that.notes);case _Error() when error != null:
return error(_that.message,_that.statusCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<ContentWithScroreModel> images,  List<ContentWithScroreModel> documents,  List<ContentWithScroreModel> notes)  embeddingsGenerated,required TResult Function( String message,  int? statusCode)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _EmbeddingsGenerated():
return embeddingsGenerated(_that.images,_that.documents,_that.notes);case _Error():
return error(_that.message,_that.statusCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<ContentWithScroreModel> images,  List<ContentWithScroreModel> documents,  List<ContentWithScroreModel> notes)?  embeddingsGenerated,TResult? Function( String message,  int? statusCode)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _EmbeddingsGenerated() when embeddingsGenerated != null:
return embeddingsGenerated(_that.images,_that.documents,_that.notes);case _Error() when error != null:
return error(_that.message,_that.statusCode);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SearchContentsStates {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchContentsStates.initial()';
}


}




/// @nodoc


class _Loading implements SearchContentsStates {
   _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchContentsStates.loading()';
}


}




/// @nodoc


class _EmbeddingsGenerated implements SearchContentsStates {
   _EmbeddingsGenerated({required final  List<ContentWithScroreModel> images, required final  List<ContentWithScroreModel> documents, required final  List<ContentWithScroreModel> notes}): _images = images,_documents = documents,_notes = notes;
  

 final  List<ContentWithScroreModel> _images;
 List<ContentWithScroreModel> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

 final  List<ContentWithScroreModel> _documents;
 List<ContentWithScroreModel> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

 final  List<ContentWithScroreModel> _notes;
 List<ContentWithScroreModel> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of SearchContentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmbeddingsGeneratedCopyWith<_EmbeddingsGenerated> get copyWith => __$EmbeddingsGeneratedCopyWithImpl<_EmbeddingsGenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmbeddingsGenerated&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'SearchContentsStates.embeddingsGenerated(images: $images, documents: $documents, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$EmbeddingsGeneratedCopyWith<$Res> implements $SearchContentsStatesCopyWith<$Res> {
  factory _$EmbeddingsGeneratedCopyWith(_EmbeddingsGenerated value, $Res Function(_EmbeddingsGenerated) _then) = __$EmbeddingsGeneratedCopyWithImpl;
@useResult
$Res call({
 List<ContentWithScroreModel> images, List<ContentWithScroreModel> documents, List<ContentWithScroreModel> notes
});




}
/// @nodoc
class __$EmbeddingsGeneratedCopyWithImpl<$Res>
    implements _$EmbeddingsGeneratedCopyWith<$Res> {
  __$EmbeddingsGeneratedCopyWithImpl(this._self, this._then);

  final _EmbeddingsGenerated _self;
  final $Res Function(_EmbeddingsGenerated) _then;

/// Create a copy of SearchContentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? images = null,Object? documents = null,Object? notes = null,}) {
  return _then(_EmbeddingsGenerated(
images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ContentWithScroreModel>,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<ContentWithScroreModel>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<ContentWithScroreModel>,
  ));
}


}

/// @nodoc


class _Error implements SearchContentsStates {
   _Error({required this.message, this.statusCode});
  

 final  String message;
 final  int? statusCode;

/// Create a copy of SearchContentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message)&&(identical(other.statusCode, statusCode) || other.statusCode == statusCode));
}


@override
int get hashCode => Object.hash(runtimeType,message,statusCode);

@override
String toString() {
  return 'SearchContentsStates.error(message: $message, statusCode: $statusCode)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $SearchContentsStatesCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message, int? statusCode
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of SearchContentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? statusCode = freezed,}) {
  return _then(_Error(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,statusCode: freezed == statusCode ? _self.statusCode : statusCode // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
