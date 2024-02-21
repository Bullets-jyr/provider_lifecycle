import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
class AnotherCounter extends _$AnotherCounter {
  @override
  int build() {
    print('[anotherCounterProvider] initialized');
    ref.onDispose(() {
      print('[anotherCounterProvider] disposed');
    });
    ref.onCancel(() {
      print('[anotherCounterProvider] cancelled');
    });
    ref.onResume(() {
      print('[anotherCounterProvider] resumed');
    });
    ref.onAddListener(() {
      print('[anotherCounterProvider] listener added');
    });
    ref.onRemoveListener(() {
      print('[anotherCounterProvider] listener removed');
    });

    return 10;
  }

  void increment() => state += 10;
}

@riverpod
class AutoDisposeCounter extends _$AutoDisposeCounter {
  @override
  int build() {
    print('[autoDisposeCounterProvider] initialized');
    ref.onDispose(() {
      print('[autoDisposeCounterProvider] disposed');
    });
    ref.onCancel(() {
      print('[autoDisposeCounterProvider] cancelled');
    });
    ref.onResume(() {
      print('[autoDisposeCounterProvider] resumed');
    });
    // 위젯 또는 다른 프로바이더에서 ref.watch, ref.listen을 호출하면 실행됩니다.
    ref.onAddListener(() {
      print('[autoDisposeCounterProvider] listener added');
    });
    // 위젯이 disposed되거나 프로바이더가 rebuild되면 실행됩니다.
    ref.onRemoveListener(() {
      print('[autoDisposeCounterProvider] listener removed');
    });
    return 0;
  }

  void increment() => state++;
}