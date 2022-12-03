import 'package:dio/dio.dart';

import 'package:get/get.dart';

import '../models/api/product_api.dart';
import '../models/product_api_model.dart';

class ProductApiViewModel extends GetxController
    with StateMixin<List<ProductApiModel>> {
  var productApiList = <ProductApiModel>[].obs;

  @override
  void onInit() {
    getProductApi();
    super.onInit();
  }

  Future<void> getProductApi() async {
    change([], status: RxStatus.loading());
    try {
      final res = await ProductApi.fetchProduct();
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
