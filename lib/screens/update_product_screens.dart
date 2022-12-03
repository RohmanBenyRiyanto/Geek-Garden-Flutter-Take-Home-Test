import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../components/buttons/button_primary.dart';
import '../models/product_models.dart';
import '../utils/color.dart';
import '../utils/fontstyle.dart';
import '../utils/margin.dart';
import '../view_models/pick_file_view_model.dart';
import '../view_models/product_view_model.dart';
import '../view_models/update_view_model.dart';

class UpdateProductScreens extends StatelessWidget {
  const UpdateProductScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final updateController = Get.find<UpdateViewModels>();
    final productController = Get.find<ProductViewModels>();
    final pickFileController = Get.find<PickFileViewModel>();

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
                    //Getx Dialog Confirmation
                    Get.defaultDialog(
                      title: 'Delete Product',
                      middleText: 'Are you sure to delete this product?',
                      textConfirm: 'Yes',
                      textCancel: 'No',
                      confirmTextColor: whiteColor,
                      cancelTextColor: primaryColor,
                      buttonColor: primaryColor,
                      titleStyle: blackTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                      middleTextStyle: blackTextStyle.copyWith(
                        fontSize: 14.0,
                        fontWeight: regular,
                      ),
                      barrierDismissible: false,
                      onConfirm: () {
                        Get.back();
                        productController.deleteProductItem(productIndex);
                        Get.snackbar(
                          'SUCCESS',
                          '',
                          messageText: Text(
                            'Congratulation, our Product  has been deleted',
                            style: blackTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                          backgroundColor: errorColor,
                          colorText: blackColor,
                          margin: EdgeInsets.all(defaultMargin),
                          borderRadius: defaultRadius,
                          duration: const Duration(seconds: 3),
                        );
                      },
                      onCancel: () {},
                    );
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
                    ProductModel(
                      id: productController.productList.length + 1,
                      title: updateController.nameProductController.text,
                      price: updateController.priceProductController.text,
                      description:
                          updateController.descriptionProductController.text,
                      category: updateController.categoryProductController.text,
                      nameImage: pickFileController.nameFile.toString(),
                      pathImage: pickFileController.pathFile.toString(),
                    ),
                  ),
                );
                Get.snackbar(
                  'SUCCESS',
                  '',
                  messageText: Text(
                    'Congratulation, our Product  has been added',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  borderColor: greyOneColor,
                  borderWidth: 1.0,
                  margin: EdgeInsets.all(defaultMargin),
                  borderRadius: defaultRadius,
                  duration: const Duration(seconds: 3),
                );
              } else {
                productController.updateProductItem(
                  productIndex,
                  ProductModel(
                    id: product.id,
                    //when empty add from product
                    title: updateController.nameProductController.text.isEmpty
                        ? updateController.nameProductController.text =
                            product.title
                        : updateController.nameProductController.text,
                    price: updateController.priceProductController.text.isEmpty
                        ? updateController.priceProductController.text =
                            product.price
                        : updateController.priceProductController.text,
                    description: updateController
                            .descriptionProductController.text.isEmpty
                        ? updateController.descriptionProductController.text =
                            product.description
                        : updateController.descriptionProductController.text,
                    category:
                        updateController.categoryProductController.text.isEmpty
                            ? updateController.categoryProductController.text =
                                product.category
                            : updateController.categoryProductController.text,
                    nameImage: pickFileController.nameFile.toString().isEmpty
                        ? pickFileController.nameFile = product.nameImage
                        : pickFileController.nameFile.toString(),
                    pathImage: pickFileController.pathFile.toString().isEmpty
                        ? pickFileController.pathFile = product.pathImage
                        : pickFileController.pathFile.toString(),
                  ),
                );
                Get.snackbar(
                  'SUCCESS',
                  '',
                  messageText: Text(
                    'Congratulation, our Product  has been updated',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  borderColor: greyOneColor,
                  borderWidth: 1.0,
                  margin: EdgeInsets.all(defaultMargin),
                  borderRadius: defaultRadius,
                  duration: const Duration(seconds: 3),
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
                return updateController.validator(value!);
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
                return updateController.validator(value!);
              },
              onSaved: (val) {
                updateController.priceProductC = val!;
              },
              keyboardType: TextInputType.number,
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
                return updateController.validator(value!);
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
              height: defaultVertical16,
            ),
            GetBuilder<PickFileViewModel>(
              init: PickFileViewModel(),
              initState: (_) {},
              builder: (_) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: defaultVertical16),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border(
                            bottom: BorderSide(
                              width: 1.0,
                              color: greyTwoColor,
                            ),
                          ),
                        ),
                        child: args['isAdd'] == true
                            ? Text(
                                pickFileController.nameFile == ''
                                    ? 'Chose your new image'
                                    : pickFileController.nameFile.toString(),
                                style: blackTextStyle.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: regular,
                                ),
                              )
                            : Text(
                                pickFileController.nameFile != ''
                                    ? pickFileController.nameFile.toString()
                                    : product.nameImage.toString(),
                                style: blackTextStyle.copyWith(
                                  fontSize: 14.0,
                                  fontWeight: regular,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      width: defaultHorizontal16,
                    ),
                    InkWell(
                      onTap: () {
                        pickFileController.pickFile();
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(defaultHorizontal12),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(defaultRadius),
                          boxShadow: defaultCardShadow,
                        ),
                        child: SvgPicture.asset(
                          args['isAdd'] == true
                              ? pickFileController.nameFile == ''
                                  ? 'assets/svg/ic_image_add.svg'
                                  : 'assets/svg/ic_image.svg'
                              : 'assets/svg/ic_image_edit.svg',
                          fit: BoxFit.scaleDown,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(
              height: defaultVertical16,
            ),
            TextFormField(
              controller: updateController.descriptionProductController,
              validator: (value) {
                return updateController.validator(value!);
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
