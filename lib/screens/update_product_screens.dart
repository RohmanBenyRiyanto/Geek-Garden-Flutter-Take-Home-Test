import 'package:flutter/material.dart';
import 'package:flutter_home_test/models/product_models.dart';
import 'package:flutter_home_test/view_models/product_view_model.dart';
import 'package:flutter_home_test/view_models/update_view_model.dart';
import 'package:get/get.dart';

import '../components/buttons/button_primary.dart';
import '../utils/color.dart';
import '../utils/fontstyle.dart';
import '../utils/margin.dart';

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
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
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

    Widget _buildAction() {
      return Column(
        children: [
          ButtonPrimary(
            onPressed: () {
              if (args['isAdd'] == true) {
                updateController.submitUpdate(
                  productController.addProduct(
                    productController.productList.length + 1,
                    updateController.nameProductController.text,

                    double.parse(updateController.priceProductController.text),
                    // updateController.priceProductController.text,
                    updateController.descriptionProductController.text,
                    updateController.categoryProductController.text,
                    updateController.imageProductController.text,
                  ),
                );
              } else {
                productController.updateProductItem(
                  productIndex,
                  ProductModel(
                    id: product.id,
                    title: updateController.nameProductController.text.isEmpty
                        ? product.title
                        : updateController.nameProductController.text,
                    price: updateController.priceProductController.text.isEmpty
                        ? product.price
                        : double.parse(
                            updateController.priceProductController.text),
                    description: updateController
                            .descriptionProductController.text.isEmpty
                        ? product.description
                        : updateController.descriptionProductController.text,
                    category:
                        updateController.categoryProductController.text.isEmpty
                            ? product.category
                            : updateController.categoryProductController.text,
                    image: updateController.imageProductController.text.isEmpty
                        ? product.image
                        : updateController.imageProductController.text,
                  ),
                );
              }
            },
            tittle: args['isAdd'] == true ? "Save Product" : "Update Product",
          ),
        ],
      );
    }

    Widget _buildForm() {
      return Form(
        key: updateController.updateFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: updateController.nameProductController,
              validator: (value) {
                return updateController.nameValidate(value!);
              },
              onSaved: (val) {
                updateController.nameProductC = val!;
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
                return updateController.priceValidate(value!);
              },
              onSaved: (val) {
                updateController.priceProductC = val!;
              },
              decoration: InputDecoration(
                labelText: args['isAdd'] == false
                    ? product.price.toString()
                    : 'Product Price',
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
                return updateController.categoryValidate(value!);
              },
              onSaved: (val) {
                updateController.categoryProductC = val!;
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
                return updateController.imageValidate(value!);
              },
              onSaved: (val) {
                updateController.imageProductC = val!;
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
                return updateController.descriptionValidate(value!);
              },
              onSaved: (val) {
                updateController.descriptionProductC = val!;
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
            _buildAction(),
            SizedBox(
              height: defaultVertical24,
            ),
          ],
        ),
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
