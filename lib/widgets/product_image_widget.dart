import 'package:ecommerce_test_app/models/models.dart';
import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    ProductModel product = productProvider.selectedProduct;

    return Stack(
      children: [
        _ProductPhotoWidget(
          productPhoto: product.foto,
        ),
        const _BackButtonWidget(),
        const _CameraButtonWidget(),
      ],
    );
  }
}

class _CameraButtonWidget extends StatelessWidget {
  const _CameraButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.indigo,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

class _BackButtonWidget extends StatelessWidget {
  const _BackButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.indigo,
        ),
      ),
    );
  }
}

class _ProductPhotoWidget extends StatelessWidget {
  const _ProductPhotoWidget({
    Key? key,
    this.productPhoto,
  }) : super(key: key);

  final String? productPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 350.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        /*boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(2.0, 5.0),
          ),
        ],*/
      ),
      child: Opacity(
        opacity: 0.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: (productPhoto == null) ? _localImage() : _networkImage(),
        ),
      ),
    );
  }

  Widget _networkImage() {
    return FadeInImage(
      placeholder: const AssetImage('assets/images/loading.gif'),
      image: NetworkImage(productPhoto as String),
      fit: BoxFit.cover,
    );
  }

  Widget _localImage() {
    return const FadeInImage(
      placeholder: AssetImage('assets/images/loading.gif'),
      image: AssetImage('assets/images/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }
}
