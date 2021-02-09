import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../loading_state_view_model.dart';
import 'loading.dart';

class ContainerWithLoading extends HookWidget {
  final Widget _child;

  ContainerWithLoading({Widget child}) : _child = child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        HookBuilder(builder: (context) {
          final isLoading = useProvider(loadingStateProvider.state);
          return isLoading ? const Loading() : const SizedBox();
        })
      ],
    );
  }
}
