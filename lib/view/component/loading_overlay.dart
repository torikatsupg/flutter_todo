import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/global_controller/loading_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoadingOverlay extends ConsumerWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isShow = ref.watch(loadingProvider);
    if (isShow) {
      return const Indicator();
    } else {
      return const SizedBox.shrink();
    }
  }
}

class Indicator extends ConsumerWidget {
  const Indicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: Colors.black.withOpacity(0.3),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
