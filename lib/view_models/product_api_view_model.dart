import 'package:dio/dio.dart';
import 'package:flutter_home_test/models/product_api_model.dart';
import 'package:get/get.dart';

import '../models/api/product_api.dart';

class ProductApiViewModel extends GetxController
    with StateMixin<List<ProductApiModel>> {
  var productApiList = <ProductApiModel>[].obs;

  @override
  void onInit() {
    change([], status: RxStatus.loading());
    super.onInit();
  }

  Future<void> getProductApi() async {
    change([], status: RxStatus.loading());
    try {
      final res = await ProductApi.fetchProduct();
      print('Get Data Done');
      productApiList.addAll(res);
      change(res, status: RxStatus.success());
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data != null) {
          change([], status: RxStatus.error(e.response?.data['message']));
        } else {
          change([], status: RxStatus.error('Error'));
        }
      }
    }
  }
}
