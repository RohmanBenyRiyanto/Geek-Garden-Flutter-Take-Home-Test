import '../../services/services.dart';
import '../product_api_model.dart';

class ProductApi {
  static Future<List<ProductApiModel>> fetchProduct() async {
    Services repo = Services();
    final response = await repo.get(url: 'products');
    return await Future.value(
      response
          .map<ProductApiModel>((e) => ProductApiModel.fromJson(e))
          .toList(),
    );
  }
}
