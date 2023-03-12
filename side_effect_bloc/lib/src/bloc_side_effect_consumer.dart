import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';

class BlocSideEffectConsumer<B extends SideEffectProvider<C>, B1 extends StateStreamable<S>, S, C>
    extends BlocSideEffectListener<B, C> {
  BlocSideEffectConsumer({
    super.key,
    required super.listener,
    super.bloc,
    required BlocWidgetBuilder<S> builder,
  }) : super(child: BlocBuilder<B1, S>(builder: builder));
}
