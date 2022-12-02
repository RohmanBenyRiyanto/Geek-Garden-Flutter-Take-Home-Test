import 'package:flutter_home_test/models/product_api_model.dart';
import 'package:flutter_home_test/services/test_service.dart';
import 'package:get/get.dart';

class ProductApiViewModel extends GetxController {
  // ApiResponse<List<ProductModel>> _productApi =
  //     ApiResponse(status: ApiStatus.success);
  // ApiResponse<List<ProductModel>> get productApi => _productApi;

  // RxList<ProductModel> productApiList = <ProductModel>[].obs;

  // int? currentStatus;

  // @override
  // void onInit() {
  //   getProductApi();
  //   productApiList = productApi.data!.obs;
  //   super.onInit();
  // }

  // void changeState(ApiResponse<List<ProductModel>>? state) {
  //   if (state != null) {
  //     _productApi = state;
  //     update();
  //   } else {
  //     _productApi = ApiResponse(status: ApiStatus.error);
  //     update();
  //   }
  //   update();
  // }

  // Future<ApiResponse<List<ProductModel>>> getProductApi() async {
  //   try {
  //     changeState(ApiResponse(status: ApiStatus.loading));
  //     final res = await ProductApi.fetchProduct();
  //     currentStatus = null;
  //     changeState(ApiResponse(status: ApiStatus.success, data: res));
  //   } catch (e) {
  //     if (e is DioError) {
  //       if (e.response?.data != null) {
  //         changeState(ApiResponse(
  //             status: ApiStatus.error, message: e.response?.data['message']));
  //       }
  //     } else {
  //       changeState(ApiResponse(status: ApiStatus.error, message: 'Error'));
  //     }
  //   }
  //   return Future.value(_productApi);
  // }
  // RxList<ProductApiModel> productApiList = <ProductApiModel>[].obs;
  //Get Data from testServices to productApiList

  @override
  void onInit() {
    super.onInit();
    // getProductApi();
    // productApiList.refresh();
  }

  //Get Data from testServices to productApiList
  Future<void> getProductApi() async {
    try {
      final res = await TestApiService.fetchProduct();
      print('Get Data Done');
      productApiList.addAll(res);
    } catch (e) {
      print(e);
    }
  }

  var productApiList = <ProductApiModel>[].obs;
}
