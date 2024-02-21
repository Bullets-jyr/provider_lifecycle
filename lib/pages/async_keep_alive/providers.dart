import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/product.dart';

part 'providers.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(baseUrl: 'https://dummyjson.com'),
  );
}

@riverpod
FutureOr<List<Product>> getProducts(GetProductsRef ref) async {
  // dio package는 CancelToken을 이용해서 request를 cancel할 수 있는 기능을 제공합니다.
  final cancelToken = CancelToken();
  Timer? timer;

  print('[getProductsProvider] initialized');
  ref.onDispose(() {
    print('[getProductsProvider] disposed, token cancelled, timer cancelled');
    timer?.cancel();
    cancelToken.cancel();
  });
  ref.onCancel(() {
    print('[getProductsProvider] cancelled');
  });
  ref.onResume(() {
    print('[getProductsProvider] resumed, timer cancelled');
    timer?.cancel();
  });
  ref.onAddListener(() {
    print('[getProductsProvider] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductsProvider] listener removed');
  });

  final response = await ref.watch(dioProvider).get(
    '/products',
    cancelToken: cancelToken,
  );

  // 최상단으로 올릴 경우 문제가 발생합니다.
  final keepAliveLink = ref.keepAlive();

  // onCancel 메소드 뿐만 아니라 ref의 다른 메소드들은 여러번 호출될 수 있습니다.
  ref.onCancel(() {
    print('[getProductsProvider] cancelled, timer started');
    timer = Timer(const Duration(seconds: 10), () {
      keepAliveLink.close();
    });
  });

  final List productList = response.data['products'];

  print(productList[0]);

  // collection for-loop
  final products = [
    for (final product in productList) Product.fromJson(product)
  ];

  return products;
}

@riverpod
FutureOr<Product> getProduct(GetProductRef ref, { required int productId }) async {
  print('[getProductProvider($productId)] initialized');
  ref.onDispose(() {
    print('[getProductProvider($productId)] disposed');
  });
  ref.onCancel(() {
    print('[getProductProvider($productId)] canceled');
  });
  ref.onResume(() {
    print('[getProductProvider($productId)] resumed');
  });
  ref.onAddListener(() {
    print('[getProductProvider($productId)] listener added');
  });
  ref.onRemoveListener(() {
    print('[getProductProvider($productId)] listener removed');
  });

  final response = await ref.watch(dioProvider).get('/products/$productId');

  final product = Product.fromJson(response.data);

  return product;
}