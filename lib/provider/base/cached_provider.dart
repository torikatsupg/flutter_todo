import 'package:hooks_riverpod/hooks_riverpod.dart';

AutoDisposeStateNotifierProvider<StateNotifier<State>, State>
    cachedProvider<State, ProviderState>({
  required Initializer<State> initializer,
  required ProviderListenable<ProviderState> provider,
  required ShouldUpdate<ProviderState> shouldUpdate,
  required ToState<State, ProviderState> toState,
}) =>
        StateNotifierProvider.autoDispose<StateNotifier<State>, State>(
          (ref) => CachedStateNotifier<State, ProviderState>(
            ref: ref,
            initializer: initializer,
            provider: provider,
            shouldUpdate: shouldUpdate,
            toState: toState,
          ),
        );

class CachedStateNotifier<State, ProviderState> extends StateNotifier<State> {
  CachedStateNotifier({
    required Ref ref,
    required Initializer<State> initializer,
    required ProviderListenable<ProviderState> provider,
    required ShouldUpdate<ProviderState> shouldUpdate,
    required ToState<State, ProviderState> toState,
  }) : super(initializer(ref)) {
    ref.listen<ProviderState>(
      provider,
      (previous, next) {
        if (shouldUpdate(next)) {
          state = toState(next);
        }
      },
    );
  }
}

typedef Ref = AutoDisposeStateNotifierProviderRef;
typedef Initializer<State> = State Function(
    AutoDisposeStateNotifierProviderRef ref);
typedef ShouldUpdate<ProviderState> = bool Function(ProviderState next);
typedef ToState<State, ProviderState> = State Function(ProviderState next);
