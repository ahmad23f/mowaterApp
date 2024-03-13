// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_cars_companys_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentalCarsCompanysState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CompanyRentalCarsModel> companys) success,
    required TResult Function() faliure,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CompanyRentalCarsModel> companys)? success,
    TResult? Function()? faliure,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CompanyRentalCarsModel> companys)? success,
    TResult Function()? faliure,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Successs value) success,
    required TResult Function(_Faliure value) faliure,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Successs value)? success,
    TResult? Function(_Faliure value)? faliure,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Successs value)? success,
    TResult Function(_Faliure value)? faliure,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalCarsCompanysStateCopyWith<$Res> {
  factory $RentalCarsCompanysStateCopyWith(RentalCarsCompanysState value,
          $Res Function(RentalCarsCompanysState) then) =
      _$RentalCarsCompanysStateCopyWithImpl<$Res, RentalCarsCompanysState>;
}

/// @nodoc
class _$RentalCarsCompanysStateCopyWithImpl<$Res,
        $Val extends RentalCarsCompanysState>
    implements $RentalCarsCompanysStateCopyWith<$Res> {
  _$RentalCarsCompanysStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RentalCarsCompanysStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RentalCarsCompanysState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CompanyRentalCarsModel> companys) success,
    required TResult Function() faliure,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CompanyRentalCarsModel> companys)? success,
    TResult? Function()? faliure,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CompanyRentalCarsModel> companys)? success,
    TResult Function()? faliure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Successs value) success,
    required TResult Function(_Faliure value) faliure,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Successs value)? success,
    TResult? Function(_Faliure value)? faliure,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Successs value)? success,
    TResult Function(_Faliure value)? faliure,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RentalCarsCompanysState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccesssImplCopyWith<$Res> {
  factory _$$SuccesssImplCopyWith(
          _$SuccesssImpl value, $Res Function(_$SuccesssImpl) then) =
      __$$SuccesssImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CompanyRentalCarsModel> companys});
}

/// @nodoc
class __$$SuccesssImplCopyWithImpl<$Res>
    extends _$RentalCarsCompanysStateCopyWithImpl<$Res, _$SuccesssImpl>
    implements _$$SuccesssImplCopyWith<$Res> {
  __$$SuccesssImplCopyWithImpl(
      _$SuccesssImpl _value, $Res Function(_$SuccesssImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companys = null,
  }) {
    return _then(_$SuccesssImpl(
      null == companys
          ? _value._companys
          : companys // ignore: cast_nullable_to_non_nullable
              as List<CompanyRentalCarsModel>,
    ));
  }
}

/// @nodoc

class _$SuccesssImpl implements _Successs {
  const _$SuccesssImpl(final List<CompanyRentalCarsModel> companys)
      : _companys = companys;

  final List<CompanyRentalCarsModel> _companys;
  @override
  List<CompanyRentalCarsModel> get companys {
    if (_companys is EqualUnmodifiableListView) return _companys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companys);
  }

  @override
  String toString() {
    return 'RentalCarsCompanysState.success(companys: $companys)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccesssImpl &&
            const DeepCollectionEquality().equals(other._companys, _companys));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_companys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccesssImplCopyWith<_$SuccesssImpl> get copyWith =>
      __$$SuccesssImplCopyWithImpl<_$SuccesssImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CompanyRentalCarsModel> companys) success,
    required TResult Function() faliure,
    required TResult Function() loading,
  }) {
    return success(companys);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CompanyRentalCarsModel> companys)? success,
    TResult? Function()? faliure,
    TResult? Function()? loading,
  }) {
    return success?.call(companys);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CompanyRentalCarsModel> companys)? success,
    TResult Function()? faliure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(companys);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Successs value) success,
    required TResult Function(_Faliure value) faliure,
    required TResult Function(_Loading value) loading,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Successs value)? success,
    TResult? Function(_Faliure value)? faliure,
    TResult? Function(_Loading value)? loading,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Successs value)? success,
    TResult Function(_Faliure value)? faliure,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Successs implements RentalCarsCompanysState {
  const factory _Successs(final List<CompanyRentalCarsModel> companys) =
      _$SuccesssImpl;

  List<CompanyRentalCarsModel> get companys;
  @JsonKey(ignore: true)
  _$$SuccesssImplCopyWith<_$SuccesssImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FaliureImplCopyWith<$Res> {
  factory _$$FaliureImplCopyWith(
          _$FaliureImpl value, $Res Function(_$FaliureImpl) then) =
      __$$FaliureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaliureImplCopyWithImpl<$Res>
    extends _$RentalCarsCompanysStateCopyWithImpl<$Res, _$FaliureImpl>
    implements _$$FaliureImplCopyWith<$Res> {
  __$$FaliureImplCopyWithImpl(
      _$FaliureImpl _value, $Res Function(_$FaliureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FaliureImpl implements _Faliure {
  const _$FaliureImpl();

  @override
  String toString() {
    return 'RentalCarsCompanysState.faliure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FaliureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CompanyRentalCarsModel> companys) success,
    required TResult Function() faliure,
    required TResult Function() loading,
  }) {
    return faliure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CompanyRentalCarsModel> companys)? success,
    TResult? Function()? faliure,
    TResult? Function()? loading,
  }) {
    return faliure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CompanyRentalCarsModel> companys)? success,
    TResult Function()? faliure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (faliure != null) {
      return faliure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Successs value) success,
    required TResult Function(_Faliure value) faliure,
    required TResult Function(_Loading value) loading,
  }) {
    return faliure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Successs value)? success,
    TResult? Function(_Faliure value)? faliure,
    TResult? Function(_Loading value)? loading,
  }) {
    return faliure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Successs value)? success,
    TResult Function(_Faliure value)? faliure,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (faliure != null) {
      return faliure(this);
    }
    return orElse();
  }
}

abstract class _Faliure implements RentalCarsCompanysState {
  const factory _Faliure() = _$FaliureImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RentalCarsCompanysStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RentalCarsCompanysState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<CompanyRentalCarsModel> companys) success,
    required TResult Function() faliure,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<CompanyRentalCarsModel> companys)? success,
    TResult? Function()? faliure,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<CompanyRentalCarsModel> companys)? success,
    TResult Function()? faliure,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Successs value) success,
    required TResult Function(_Faliure value) faliure,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Successs value)? success,
    TResult? Function(_Faliure value)? faliure,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Successs value)? success,
    TResult Function(_Faliure value)? faliure,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RentalCarsCompanysState {
  const factory _Loading() = _$LoadingImpl;
}
