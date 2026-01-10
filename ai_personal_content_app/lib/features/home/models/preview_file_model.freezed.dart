// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreviewFileModel {

 String get cid; File get file; String get name; String? get imageDescription; String? get scannedImageTexts; int get sizeInBytes; String get extension; ContentFileType get fileType; bool get isLoading; double? get loadingProgress;
/// Create a copy of PreviewFileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewFileModelCopyWith<PreviewFileModel> get copyWith => _$PreviewFileModelCopyWithImpl<PreviewFileModel>(this as PreviewFileModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewFileModel&&(identical(other.cid, cid) || other.cid == cid)&&(identical(other.file, file) || other.file == file)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageDescription, imageDescription) || other.imageDescription == imageDescription)&&(identical(other.scannedImageTexts, scannedImageTexts) || other.scannedImageTexts == scannedImageTexts)&&(identical(other.sizeInBytes, sizeInBytes) || other.sizeInBytes == sizeInBytes)&&(identical(other.extension, extension) || other.extension == extension)&&(identical(other.fileType, fileType) || other.fileType == fileType)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.loadingProgress, loadingProgress) || other.loadingProgress == loadingProgress));
}


@override
int get hashCode => Object.hash(runtimeType,cid,file,name,imageDescription,scannedImageTexts,sizeInBytes,extension,fileType,isLoading,loadingProgress);

@override
String toString() {
  return 'PreviewFileModel(cid: $cid, file: $file, name: $name, imageDescription: $imageDescription, scannedImageTexts: $scannedImageTexts, sizeInBytes: $sizeInBytes, extension: $extension, fileType: $fileType, isLoading: $isLoading, loadingProgress: $loadingProgress)';
}


}

/// @nodoc
abstract mixin class $PreviewFileModelCopyWith<$Res>  {
  factory $PreviewFileModelCopyWith(PreviewFileModel value, $Res Function(PreviewFileModel) _then) = _$PreviewFileModelCopyWithImpl;
@useResult
$Res call({
 String cid, File file, String name, String? imageDescription, String? scannedImageTexts, int sizeInBytes, String extension, ContentFileType fileType, bool isLoading, double? loadingProgress
});




}
/// @nodoc
class _$PreviewFileModelCopyWithImpl<$Res>
    implements $PreviewFileModelCopyWith<$Res> {
  _$PreviewFileModelCopyWithImpl(this._self, this._then);

  final PreviewFileModel _self;
  final $Res Function(PreviewFileModel) _then;

/// Create a copy of PreviewFileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cid = null,Object? file = null,Object? name = null,Object? imageDescription = freezed,Object? scannedImageTexts = freezed,Object? sizeInBytes = null,Object? extension = null,Object? fileType = null,Object? isLoading = null,Object? loadingProgress = freezed,}) {
  return _then(PreviewFileModel._(
cid: null == cid ? _self.cid : cid // ignore: cast_nullable_to_non_nullable
as String,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageDescription: freezed == imageDescription ? _self.imageDescription : imageDescription // ignore: cast_nullable_to_non_nullable
as String?,scannedImageTexts: freezed == scannedImageTexts ? _self.scannedImageTexts : scannedImageTexts // ignore: cast_nullable_to_non_nullable
as String?,sizeInBytes: null == sizeInBytes ? _self.sizeInBytes : sizeInBytes // ignore: cast_nullable_to_non_nullable
as int,extension: null == extension ? _self.extension : extension // ignore: cast_nullable_to_non_nullable
as String,fileType: null == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as ContentFileType,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,loadingProgress: freezed == loadingProgress ? _self.loadingProgress : loadingProgress // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [PreviewFileModel].
extension PreviewFileModelPatterns on PreviewFileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
