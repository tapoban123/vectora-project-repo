// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_embedding_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentEmbeddingResponseModel {

 String? get id; String? get cid;// content Id
 String? get description; String? get contentType; List<double> get embeddings;
/// Create a copy of ContentEmbeddingResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentEmbeddingResponseModelCopyWith<ContentEmbeddingResponseModel> get copyWith => _$ContentEmbeddingResponseModelCopyWithImpl<ContentEmbeddingResponseModel>(this as ContentEmbeddingResponseModel, _$identity);

  /// Serializes this ContentEmbeddingResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentEmbeddingResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.description, description) || other.description == description)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&const DeepCollectionEquality().equals(other.embeddings, embeddings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cid,description,contentType,const DeepCollectionEquality().hash(embeddings));

@override
String toString() {
  return 'ContentEmbeddingResponseModel(id: $id, cid: $cid, description: $description, contentType: $contentType, embeddings: $embeddings)';
}


}

/// @nodoc
abstract mixin class $ContentEmbeddingResponseModelCopyWith<$Res>  {
  factory $ContentEmbeddingResponseModelCopyWith(ContentEmbeddingResponseModel value, $Res Function(ContentEmbeddingResponseModel) _then) = _$ContentEmbeddingResponseModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? cid, String? description, String? contentType, List<double> embeddings
});




}
/// @nodoc
class _$ContentEmbeddingResponseModelCopyWithImpl<$Res>
    implements $ContentEmbeddingResponseModelCopyWith<$Res> {
  _$ContentEmbeddingResponseModelCopyWithImpl(this._self, this._then);

  final ContentEmbeddingResponseModel _self;
  final $Res Function(ContentEmbeddingResponseModel) _then;

/// Create a copy of ContentEmbeddingResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? cid = freezed,Object? description = freezed,Object? contentType = freezed,Object? embeddings = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cid: freezed == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,embeddings: null == embeddings ? _self.embeddings : embeddings // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentEmbeddingResponseModel].
extension ContentEmbeddingResponseModelPatterns on ContentEmbeddingResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentEmbeddingResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentEmbeddingResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentEmbeddingResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? cid,  String? description,  String? contentType,  List<double> embeddings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel() when $default != null:
return $default(_that.id,_that.cid,_that.description,_that.contentType,_that.embeddings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? cid,  String? description,  String? contentType,  List<double> embeddings)  $default,) {final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel():
return $default(_that.id,_that.cid,_that.description,_that.contentType,_that.embeddings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? cid,  String? description,  String? contentType,  List<double> embeddings)?  $default,) {final _that = this;
switch (_that) {
case _ContentEmbeddingResponseModel() when $default != null:
return $default(_that.id,_that.cid,_that.description,_that.contentType,_that.embeddings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentEmbeddingResponseModel implements ContentEmbeddingResponseModel {
   _ContentEmbeddingResponseModel({this.id, this.cid, this.description, this.contentType, required final  List<double> embeddings}): _embeddings = embeddings;
  factory _ContentEmbeddingResponseModel.fromJson(Map<String, dynamic> json) => _$ContentEmbeddingResponseModelFromJson(json);

@override final  String? id;
@override final  String? cid;
// content Id
@override final  String? description;
@override final  String? contentType;
 final  List<double> _embeddings;
@override List<double> get embeddings {
  if (_embeddings is EqualUnmodifiableListView) return _embeddings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_embeddings);
}


/// Create a copy of ContentEmbeddingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentEmbeddingResponseModelCopyWith<_ContentEmbeddingResponseModel> get copyWith => __$ContentEmbeddingResponseModelCopyWithImpl<_ContentEmbeddingResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentEmbeddingResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentEmbeddingResponseModel&&(identical(other.id, id) || other.id == id)&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.description, description) || other.description == description)&&(identical(other.contentType, contentType) || other.contentType == contentType)&&const DeepCollectionEquality().equals(other._embeddings, _embeddings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,cid,description,contentType,const DeepCollectionEquality().hash(_embeddings));

@override
String toString() {
  return 'ContentEmbeddingResponseModel(id: $id, cid: $cid, description: $description, contentType: $contentType, embeddings: $embeddings)';
}


}

/// @nodoc
abstract mixin class _$ContentEmbeddingResponseModelCopyWith<$Res> implements $ContentEmbeddingResponseModelCopyWith<$Res> {
  factory _$ContentEmbeddingResponseModelCopyWith(_ContentEmbeddingResponseModel value, $Res Function(_ContentEmbeddingResponseModel) _then) = __$ContentEmbeddingResponseModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? cid, String? description, String? contentType, List<double> embeddings
});




}
/// @nodoc
class __$ContentEmbeddingResponseModelCopyWithImpl<$Res>
    implements _$ContentEmbeddingResponseModelCopyWith<$Res> {
  __$ContentEmbeddingResponseModelCopyWithImpl(this._self, this._then);

  final _ContentEmbeddingResponseModel _self;
  final $Res Function(_ContentEmbeddingResponseModel) _then;

/// Create a copy of ContentEmbeddingResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? cid = freezed,Object? description = freezed,Object? contentType = freezed,Object? embeddings = null,}) {
  return _then(_ContentEmbeddingResponseModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,cid: freezed == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as String?,embeddings: null == embeddings ? _self._embeddings : embeddings // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
