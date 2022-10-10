import 'dart:io';
import 'package:ecommerce_test_app/providers/providers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImageWidget extends StatefulWidget {
  const ProductImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductImageWidget> createState() => _ProductImageWidgetState();
}

class _ProductImageWidgetState extends State<ProductImageWidget> {
  String takedOrSelectedPhoto = '';
  bool isCameraOrGallery = false;

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Stack(
      children: [
        Container(
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
              child: (isCameraOrGallery)
                  ? _filePhoto()
                  : _networkOrLocalPhoto(productProvider.selectedProduct.foto),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                productProvider.updateSelectedProductPhoto(path: null);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.indigo,
              ),
            ),
            IconButton(
              onPressed: () => _takeOrSelectedPhoto(productProvider),
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.indigo,
                size: 30.0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _takeOrSelectedPhoto(ProductProvider productProvider) async {
    final imagePicker = ImagePicker();
    /*final XFile? cameraPhotho =
                await imagePicker.pickImage(source: ImageSource.camera);*/
    final XFile? galleryPhoto =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (galleryPhoto != null) {
      setState(() {
        productProvider.updateSelectedProductPhoto(path: galleryPhoto.path);
        takedOrSelectedPhoto = galleryPhoto.path;
        isCameraOrGallery = true;
      });
    }
  }

  Widget _networkPhoto({required String productPhoto}) {
    return FadeInImage(
      placeholder: const AssetImage('assets/images/loading.gif'),
      image: NetworkImage(productPhoto),
      fit: BoxFit.cover,
    );
  }

  Widget _localPhoto() {
    return const Image(
      image: AssetImage('assets/images/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _filePhoto() {
    return Image.file(
      File(takedOrSelectedPhoto),
      fit: BoxFit.cover,
    );
  }

  Widget _networkOrLocalPhoto(String? productPhoto) {
    return (productPhoto == null)
        ? _localPhoto()
        : _networkPhoto(productPhoto: productPhoto);
  }
}



/*class _CameraButtonWidget extends StatelessWidget {
  const _CameraButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () async {
            final imagePicker = ImagePicker();
            /*final XFile? cameraPhotho =
                await imagePicker.pickImage(source: ImageSource.camera);*/
            final galleryPhoto =
                await imagePicker.pickImage(source: ImageSource.gallery);

            if (galleryPhoto == null) {
              print('No se eligió ninguna foto');
              return;
            }

            print('imagen elegida y esta es su ruta ${galleryPhoto.path}');
            productProvider.updateSelectedProductPhoto(path: galleryPhoto.path);
          },
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

class _ProductPhotoWidget extends StatelessWidget {
  const _ProductPhotoWidget({
    Key? key,
    this.productPhoto,
  }) : super(key: key);

  final String? productPhoto;

  @override
  Widget build(BuildContext context) {
    //final productProvider = Provider.of<ProductProvider>(context);

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
          child: _choosingProductPhoto(productProvider.selectedProduct.foto),
        ),
      ),
    );
  }

  Widget _networkPhoto({required String productPhoto}) {
    return FadeInImage(
      placeholder: const AssetImage('assets/images/loading.gif'),
      image: NetworkImage(productPhoto),
      fit: BoxFit.cover,
    );
  }

  Widget _localPhoto() {
    return const Image(
      image: AssetImage('assets/images/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }

  Widget _mobilePhoto({required String photoFile}) {
    return Image.file(
      File(photoFile),
      fit: BoxFit.cover,
    );
  }

  Widget _choosingProductPhoto(String? productPhoto) {
    if (productPhoto == null) {
      return _localPhoto();
    }

    if (productPhoto.startsWith('http')) {
      return _networkPhoto(productPhoto: productPhoto);
    }

    return _mobilePhoto(photoFile: productPhoto);
  }
}*/
