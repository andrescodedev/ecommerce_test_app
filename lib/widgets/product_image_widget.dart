import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _ProductPhotoWidget(),
        _BackButtonWidget(),
        _CameraButtonWidget(),
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
            color: Colors.white,
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
          color: Colors.white,
        ),
      ),
    );
  }
}

class _ProductPhotoWidget extends StatelessWidget {
  const _ProductPhotoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 350.0,
      margin: const EdgeInsets.only(
        bottom: 40.0,
      ),
      decoration: const BoxDecoration(
        color: Colors.indigo,
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
      /*child: const FadeInImage(
        placeholder: AssetImage('assets/images/loading.gif'),
        image: AssetImage('assets/images/no-image.jpg'),
        fit: BoxFit.cover,
      ),*/
    );
  }
}
