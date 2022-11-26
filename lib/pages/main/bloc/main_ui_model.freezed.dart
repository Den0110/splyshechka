// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'main_ui_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainUiModel {
  double get balance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainUiModelCopyWith<MainUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainUiModelCopyWith<$Res> {
  factory $MainUiModelCopyWith(
          MainUiModel value, $Res Function(MainUiModel) then) =
      _$MainUiModelCopyWithImpl<$Res, MainUiModel>;
  @useResult
  $Res call({double balance});
}

/// @nodoc
class _$MainUiModelCopyWithImpl<$Res, $Val extends MainUiModel>
    implements $MainUiModelCopyWith<$Res> {
  _$MainUiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_value.copyWith(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MainUiModelCopyWith<$Res>
    implements $MainUiModelCopyWith<$Res> {
  factory _$$_MainUiModelCopyWith(
          _$_MainUiModel value, $Res Function(_$_MainUiModel) then) =
      __$$_MainUiModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double balance});
}

/// @nodoc
class __$$_MainUiModelCopyWithImpl<$Res>
    extends _$MainUiModelCopyWithImpl<$Res, _$_MainUiModel>
    implements _$$_MainUiModelCopyWith<$Res> {
  __$$_MainUiModelCopyWithImpl(
      _$_MainUiModel _value, $Res Function(_$_MainUiModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balance = null,
  }) {
    return _then(_$_MainUiModel(
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_MainUiModel implements _MainUiModel {
  const _$_MainUiModel({required this.balance});

  @override
  final double balance;

  @override
  String toString() {
    return 'MainUiModel(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MainUiModel &&
            (identical(other.balance, balance) || other.balance == balance));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MainUiModelCopyWith<_$_MainUiModel> get copyWith =>
      __$$_MainUiModelCopyWithImpl<_$_MainUiModel>(this, _$identity);
}

abstract class _MainUiModel implements MainUiModel {
  const factory _MainUiModel({required final double balance}) = _$_MainUiModel;

  @override
  double get balance;
  @override
  @JsonKey(ignore: true)
  _$$_MainUiModelCopyWith<_$_MainUiModel> get copyWith =>
      throw _privateConstructorUsedError;
}
