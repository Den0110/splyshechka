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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? avatarClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? avatarClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AvatarClicked value) avatarClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvatarClicked value)? avatarClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvatarClicked value)? avatarClicked,
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
  }) {
    return avatarClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? avatarClicked,
  }) {
    return avatarClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? avatarClicked,
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
  }) {
    return avatarClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AvatarClicked value)? avatarClicked,
  }) {
    return avatarClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AvatarClicked value)? avatarClicked,
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
mixin _$MainState {
  MainUiModel get uiModel => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainUiModel uiModel) initial,
    required TResult Function(MainUiModel uiModel) navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainUiModel uiModel)? initial,
    TResult? Function(MainUiModel uiModel)? navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainUiModel uiModel)? initial,
    TResult Function(MainUiModel uiModel)? navToProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(NavToProfile value) navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(NavToProfile value)? navToProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(NavToProfile value)? navToProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call({MainUiModel uiModel});

  $MainUiModelCopyWith<$Res> get uiModel;
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiModel = null,
  }) {
    return _then(_value.copyWith(
      uiModel: null == uiModel
          ? _value.uiModel
          : uiModel // ignore: cast_nullable_to_non_nullable
              as MainUiModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MainUiModelCopyWith<$Res> get uiModel {
    return $MainUiModelCopyWith<$Res>(_value.uiModel, (value) {
      return _then(_value.copyWith(uiModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> implements $MainStateCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainUiModel uiModel});

  @override
  $MainUiModelCopyWith<$Res> get uiModel;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiModel = null,
  }) {
    return _then(_$Initial(
      uiModel: null == uiModel
          ? _value.uiModel
          : uiModel // ignore: cast_nullable_to_non_nullable
              as MainUiModel,
    ));
  }
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial({required this.uiModel});

  @override
  final MainUiModel uiModel;

  @override
  String toString() {
    return 'MainState.initial(uiModel: $uiModel)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialCopyWith<_$Initial> get copyWith =>
      __$$InitialCopyWithImpl<_$Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainUiModel uiModel) initial,
    required TResult Function(MainUiModel uiModel) navToProfile,
  }) {
    return initial(uiModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainUiModel uiModel)? initial,
    TResult? Function(MainUiModel uiModel)? navToProfile,
  }) {
    return initial?.call(uiModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainUiModel uiModel)? initial,
    TResult Function(MainUiModel uiModel)? navToProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(uiModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(NavToProfile value) navToProfile,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(NavToProfile value)? navToProfile,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(NavToProfile value)? navToProfile,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements MainState {
  const factory Initial({required final MainUiModel uiModel}) = _$Initial;

  @override
  MainUiModel get uiModel;
  @override
  @JsonKey(ignore: true)
  _$$InitialCopyWith<_$Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NavToProfileCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$NavToProfileCopyWith(
          _$NavToProfile value, $Res Function(_$NavToProfile) then) =
      __$$NavToProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MainUiModel uiModel});

  @override
  $MainUiModelCopyWith<$Res> get uiModel;
}

/// @nodoc
class __$$NavToProfileCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$NavToProfile>
    implements _$$NavToProfileCopyWith<$Res> {
  __$$NavToProfileCopyWithImpl(
      _$NavToProfile _value, $Res Function(_$NavToProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uiModel = null,
  }) {
    return _then(_$NavToProfile(
      uiModel: null == uiModel
          ? _value.uiModel
          : uiModel // ignore: cast_nullable_to_non_nullable
              as MainUiModel,
    ));
  }
}

/// @nodoc

class _$NavToProfile implements NavToProfile {
  _$NavToProfile({required this.uiModel});

  @override
  final MainUiModel uiModel;

  @override
  String toString() {
    return 'MainState.navToProfile(uiModel: $uiModel)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavToProfileCopyWith<_$NavToProfile> get copyWith =>
      __$$NavToProfileCopyWithImpl<_$NavToProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MainUiModel uiModel) initial,
    required TResult Function(MainUiModel uiModel) navToProfile,
  }) {
    return navToProfile(uiModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MainUiModel uiModel)? initial,
    TResult? Function(MainUiModel uiModel)? navToProfile,
  }) {
    return navToProfile?.call(uiModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MainUiModel uiModel)? initial,
    TResult Function(MainUiModel uiModel)? navToProfile,
    required TResult orElse(),
  }) {
    if (navToProfile != null) {
      return navToProfile(uiModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(NavToProfile value) navToProfile,
  }) {
    return navToProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(NavToProfile value)? navToProfile,
  }) {
    return navToProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(NavToProfile value)? navToProfile,
    required TResult orElse(),
  }) {
    if (navToProfile != null) {
      return navToProfile(this);
    }
    return orElse();
  }
}

abstract class NavToProfile implements MainState {
  factory NavToProfile({required final MainUiModel uiModel}) = _$NavToProfile;

  @override
  MainUiModel get uiModel;
  @override
  @JsonKey(ignore: true)
  _$$NavToProfileCopyWith<_$NavToProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
