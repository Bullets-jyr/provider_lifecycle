import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<int>(
      autoDisposeCounterProvider,
          (previous, next) {
        if (next % 3 == 0) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(content: Text('counter: $next'));
            },
          );
        }
      },
    );
    // final counter = ref.watch(autoDisposeCounterProvider);
    // final anotherCounter = ref.watch(anotherCounterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AutoDispose'),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final counter = ref.watch(autoDisposeCounterProvider);
            final anotherCounter = ref.watch(anotherCounterProvider);
            return Text('$counter : $anotherCounter');
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // FloatingActionButton: Hero Animation
          // 한 페이지에 여러개의 FloatingActionButton이 있을 경우
          // heroTag를 줘서 구분을 해야합니다.
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {
              ref.read(autoDisposeCounterProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {
              ref.read(anotherCounterProvider.notifier).increment();
              // setState(() {});
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}