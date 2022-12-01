import 'package:flutter/material.dart';

class UpdateProductScreens extends StatelessWidget {
  const UpdateProductScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar _buildHeader() {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: _buildHeader(),
    );
  }
}
