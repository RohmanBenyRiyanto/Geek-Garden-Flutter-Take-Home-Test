import 'package:flutter/material.dart';
import 'package:flutter_home_test/models/product_models.dart';
import 'package:flutter_home_test/view_models/product_view_model.dart';
import 'package:flutter_home_test/view_models/update_view_model.dart';
import 'package:get/get.dart';

import '../components/buttons/button_primary.dart';
import '../components/buttons/button_secondary.dart';
import '../themes/color.dart';
import '../themes/fontstyle.dart';
import '../themes/margin.dart';

class UpdateProductScreens extends StatelessWidget {
  const UpdateProductScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateController = Get.find<UpdateViewModels>();
    final productController = Get.find<ProductViewModels>();

    final args = Get.arguments;

    final ProductModel product = args['product'];

    final int productIndex = args['index'];

    AppBar _buildHeader() {
      return AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          splashColor: transparentColor,
          highlightColor: transparentColor,
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
        ),
        centerTitle: true,
        title: Text(
          args['isAdd'] == true ? 'Add Product' : 'Update Product',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
          ),
        ),
        actions: [
          args['isAdd'] == false
              ? IconButton(
                  onPressed: () {
                    productController.deleteProductItem(productIndex);
                  },
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  icon: const Icon(Icons.delete_outline_rounded,
                      color: Colors.red),
                )
              : const SizedBox(),
        ],
      );
    }

    Widget _buildHeading() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Information',
            style: blackTextStyle.copyWith(
              fontSize: 18.0,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(
            height: defaultVertical12,
          ),
        ],
      );
    }

    Widget _buildForm() {
      return Form(
        key: updateController.updateFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: updateController.nameProductController,
              validator: (value) {
                updateController.validator(value);
              },
              decoration: InputDecoration(
                labelText:
                    args['isAdd'] == false ? product.title : 'Product Name',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                hintText: args['isAdd'] == false
                    ? 'Enter your new name'
                    : 'Enter your product name',
                hintStyle: subtitleTwoTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyTwoColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultVertical6,
            ),
            TextFormField(
              controller: updateController.priceProductController,
              validator: (value) {
                updateController.validator(value);
              },
              decoration: InputDecoration(
                labelText:
                    args['isAdd'] == false ? product.price : 'Product Price',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                hintText: args['isAdd'] == false
                    ? 'Enter your new price'
                    : 'Enter your product price',
                hintStyle: subtitleTwoTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyTwoColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultVertical6,
            ),
            TextFormField(
              controller: updateController.categoryProductController,
              validator: (value) {
                updateController.validator(value);
              },
              decoration: InputDecoration(
                labelText: args['isAdd'] == false
                    ? product.category
                    : 'Product Category',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                hintText: args['isAdd'] == false
                    ? 'Enter your new category'
                    : 'Enter your product category',
                hintStyle: subtitleTwoTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyTwoColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultVertical6,
            ),
            TextFormField(
              controller: updateController.imageProductController,
              validator: (value) {
                updateController.validator(value);
              },
              decoration: InputDecoration(
                labelText:
                    args['isAdd'] == false ? product.image : 'Product Image',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                hintText: args['isAdd'] == false
                    ? 'Enter your new URL image'
                    : 'Enter your link/url product image',
                hintStyle: subtitleTwoTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyTwoColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultVertical6,
            ),
            TextFormField(
              controller: updateController.descriptionProductController,
              validator: (value) {
                updateController.validator(value);
              },
              maxLines: 3,
              decoration: InputDecoration(
                labelText: args['isAdd'] == false
                    ? product.description
                    : 'Product Description',
                labelStyle: blackTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                hintText: args['isAdd'] == false
                    ? 'Enter your new description'
                    : 'Enter your product description',
                hintStyle: subtitleTwoTextStyle.copyWith(
                  fontSize: 14.0,
                  fontWeight: regular,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: greyTwoColor,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: blackColor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: defaultVertical24,
            ),
          ],
        ),
      );
    }

    Widget _buildAction() {
      return Column(
        children: [
          ButtonPrimary(
            onPressed: () {
              args['isAdd'] == true
                  ? productController.addProduct(
                      productController.productList.length + 1,
                      updateController.nameProductController.text,
                      updateController.priceProductController.text,
                      updateController.descriptionProductController.text,
                      updateController.categoryProductController.text,
                      updateController.imageProductController.text,
                    )
                  : productController.updateProductItem(
                      productIndex,
                      ProductModel(
                        id: product.id,
                        title:
                            updateController.nameProductController.text.isEmpty
                                ? product.title
                                : updateController.nameProductController.text,
                        price:
                            updateController.priceProductController.text.isEmpty
                                ? product.price
                                : updateController.priceProductController.text,
                        description: updateController
                                .descriptionProductController.text.isEmpty
                            ? product.price
                            : updateController
                                .descriptionProductController.text,
                        category: updateController
                                .categoryProductController.text.isEmpty
                            ? product.category
                            : updateController.categoryProductController.text,
                        image:
                            updateController.imageProductController.text.isEmpty
                                ? product.image
                                : updateController.imageProductController.text,
                      ),
                    );
            },
            tittle: "Save Product",
          ),
          SizedBox(
            height: defaultVertical24,
          ),
          ButtonSecondary(
            onPressed: () {},
            tittle: "Clear Form",
          ),
        ],
      );
    }

    Widget _buildContent() {
      return Container(
        margin: EdgeInsets.all(
          defaultMargin,
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          children: [
            _buildHeading(),
            _buildForm(),
            _buildAction(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: _buildHeader(),
      body: _buildContent(),
    );
  }
}
