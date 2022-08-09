import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    print('provider added: ${provider.name}');
  }

  /// A provider emitted an error, be it by throwing during initialization
  /// or by having a [Future]/[Stream] emit an error
  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {}

  /// Called my providers when they emit a notification.
  ///
  /// - [newValue] will be `null` if the provider threw during initialization.
  /// - [previousValue] will be `null` if the previous build threw during initialization.
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('provider updated: ${provider.name}');
  }

  /// A provider was disposed
  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    print('provider disposed: ${provider.name}');
  }
}
