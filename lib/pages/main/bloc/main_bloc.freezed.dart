// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() avatarClicked,
    required TResult Function() pageOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? avatarClicked,
    TResult? Function()? pageOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? avatarClicked,
    TResult Function()? pageOpened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AvatarClicked value) avatarClicked,
    required TResult Function(PageOpened value) pageOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvatarClicked value)? avatarClicked,
    TResult? Function(PageOpened value)? pageOpened,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvatarClicked value)? avatarClicked,
    TResult Function(PageOpened value)? pageOpened,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainEventCopyWith<$Res> {
  factory $MainEventCopyWith(MainEvent value, $Res Function(MainEvent) then) =
      _$MainEventCopyWithImpl<$Res, MainEvent>;
}

/// @nodoc
class _$MainEventCopyWithImpl<$Res, $Val extends MainEvent>
    implements $MainEventCopyWith<$Res> {
  _$MainEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AvatarClickedCopyWith<$Res> {
  factory _$$AvatarClickedCopyWith(
          _$AvatarClicked value, $Res Function(_$AvatarClicked) then) =
      __$$AvatarClickedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AvatarClickedCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$AvatarClicked>
    implements _$$AvatarClickedCopyWith<$Res> {
  __$$AvatarClickedCopyWithImpl(
      _$AvatarClicked _value, $Res Function(_$AvatarClicked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AvatarClicked implements AvatarClicked {
  const _$AvatarClicked();

  @override
  String toString() {
    return 'MainEvent.avatarClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AvatarClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() avatarClicked,
    required TResult Function() pageOpened,
  }) {
    return avatarClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? avatarClicked,
    TResult? Function()? pageOpened,
  }) {
    return avatarClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? avatarClicked,
    TResult Function()? pageOpened,
    required TResult orElse(),
  }) {
    if (avatarClicked != null) {
      return avatarClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AvatarClicked value) avatarClicked,
    required TResult Function(PageOpened value) pageOpened,
  }) {
    return avatarClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvatarClicked value)? avatarClicked,
    TResult? Function(PageOpened value)? pageOpened,
  }) {
    return avatarClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvatarClicked value)? avatarClicked,
    TResult Function(PageOpened value)? pageOpened,
    required TResult orElse(),
  }) {
    if (avatarClicked != null) {
      return avatarClicked(this);
    }
    return orElse();
  }
}

abstract class AvatarClicked implements MainEvent {
  const factory AvatarClicked() = _$AvatarClicked;
}

/// @nodoc
abstract class _$$PageOpenedCopyWith<$Res> {
  factory _$$PageOpenedCopyWith(
          _$PageOpened value, $Res Function(_$PageOpened) then) =
      __$$PageOpenedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PageOpenedCopyWithImpl<$Res>
    extends _$MainEventCopyWithImpl<$Res, _$PageOpened>
    implements _$$PageOpenedCopyWith<$Res> {
  __$$PageOpenedCopyWithImpl(
      _$PageOpened _value, $Res Function(_$PageOpened) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PageOpened implements PageOpened {
  const _$PageOpened();

  @override
  String toString() {
    return 'MainEvent.pageOpened()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PageOpened);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() avatarClicked,
    required TResult Function() pageOpened,
  }) {
    return pageOpened();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? avatarClicked,
    TResult? Function()? pageOpened,
  }) {
    return pageOpened?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? avatarClicked,
    TResult Function()? pageOpened,
    required TResult orElse(),
  }) {
    if (pageOpened != null) {
      return pageOpened();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AvatarClicked value) avatarClicked,
    required TResult Function(PageOpened value) pageOpened,
  }) {
    return pageOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvatarClicked value)? avatarClicked,
    TResult? Function(PageOpened value)? pageOpened,
  }) {
    return pageOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvatarClicked value)? avatarClicked,
    TResult Function(PageOpened value)? pageOpened,
    required TResult orElse(),
  }) {
    if (pageOpened != null) {
      return pageOpened(this);
    }
    return orElse();
  }
}

abstract class PageOpened implements MainEvent {
  const factory PageOpened() = _$PageOpened;
}

/// @nodoc
mixin _$MainCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navToProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavToProfile value) navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavToProfile value)? navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavToProfile value)? navToProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainCommandCopyWith<$Res> {
  factory $MainCommandCopyWith(
          MainCommand value, $Res Function(MainCommand) then) =
      _$MainCommandCopyWithImpl<$Res, MainCommand>;
}

/// @nodoc
class _$MainCommandCopyWithImpl<$Res, $Val extends MainCommand>
    implements $MainCommandCopyWith<$Res> {
  _$MainCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NavToProfileCopyWith<$Res> {
  factory _$$NavToProfileCopyWith(
          _$NavToProfile value, $Res Function(_$NavToProfile) then) =
      __$$NavToProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NavToProfileCopyWithImpl<$Res>
    extends _$MainCommandCopyWithImpl<$Res, _$NavToProfile>
    implements _$$NavToProfileCopyWith<$Res> {
  __$$NavToProfileCopyWithImpl(
      _$NavToProfile _value, $Res Function(_$NavToProfile) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NavToProfile implements NavToProfile {
  const _$NavToProfile();

  @override
  String toString() {
    return 'MainCommand.navToProfile()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NavToProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() navToProfile,
  }) {
    return navToProfile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? navToProfile,
  }) {
    return navToProfile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? navToProfile,
    required TResult orElse(),
  }) {
    if (navToProfile != null) {
      return navToProfile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NavToProfile value) navToProfile,
  }) {
    return navToProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NavToProfile value)? navToProfile,
  }) {
    return navToProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NavToProfile value)? navToProfile,
    required TResult orElse(),
  }) {
    if (navToProfile != null) {
      return navToProfile(this);
    }
    return orElse();
  }
}

abstract class NavToProfile implements MainCommand {
  const factory NavToProfile() = _$NavToProfile;
}

/// @nodoc
mixin _$MainState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SleepUser user) pageOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SleepUser user)? pageOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SleepUser user)? pageOpen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(PageOpen value) pageOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(PageOpen value)? pageOpen,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(PageOpen value)? pageOpen,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'MainState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SleepUser user) pageOpen,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SleepUser user)? pageOpen,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SleepUser user)? pageOpen,
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
    required TResult Function(Initial value) initial,
    required TResult Function(PageOpen value) pageOpen,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(PageOpen value)? pageOpen,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(PageOpen value)? pageOpen,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MainState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$PageOpenCopyWith<$Res> {
  factory _$$PageOpenCopyWith(
          _$PageOpen value, $Res Function(_$PageOpen) then) =
      __$$PageOpenCopyWithImpl<$Res>;
  @useResult
  $Res call({SleepUser user});

  $SleepUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$PageOpenCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$PageOpen>
    implements _$$PageOpenCopyWith<$Res> {
  __$$PageOpenCopyWithImpl(_$PageOpen _value, $Res Function(_$PageOpen) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$PageOpen(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as SleepUser,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SleepUserCopyWith<$Res> get user {
    return $SleepUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$PageOpen implements PageOpen {
  const _$PageOpen({required this.user});

  @override
  final SleepUser user;

  @override
  String toString() {
    return 'MainState.pageOpen(user: $user)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PageOpenCopyWith<_$PageOpen> get copyWith =>
      __$$PageOpenCopyWithImpl<_$PageOpen>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SleepUser user) pageOpen,
  }) {
    return pageOpen(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SleepUser user)? pageOpen,
  }) {
    return pageOpen?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SleepUser user)? pageOpen,
    required TResult orElse(),
  }) {
    if (pageOpen != null) {
      return pageOpen(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(PageOpen value) pageOpen,
  }) {
    return pageOpen(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(PageOpen value)? pageOpen,
  }) {
    return pageOpen?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(PageOpen value)? pageOpen,
    required TResult orElse(),
  }) {
    if (pageOpen != null) {
      return pageOpen(this);
    }
    return orElse();
  }
}

abstract class PageOpen implements MainState {
  const factory PageOpen({required final SleepUser user}) = _$PageOpen;

  SleepUser get user;
  @JsonKey(ignore: true)
  _$$PageOpenCopyWith<_$PageOpen> get copyWith =>
      throw _privateConstructorUsedError;
}
