import 'package:ecommerce_test_app/models/models.dart';
import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0,
      height: 300.0,
      margin: const EdgeInsets.only(
        bottom: 40.0,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(2.0, 5.0),
          ),
        ],
      ),
      child: Stack(
        children: [
          _BackgroundImage(
            product: product,
          ),
          _DetailsTagWidget(
            product: product,
          ),
          _PriceTagWidget(
            product: product,
          ),
          _AvailableTagWidget(
            product: product,
          ),
        ],
      ),
    );
  }
}

class _AvailableTagWidget extends StatelessWidget {
  const _AvailableTagWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: 100.0,
        height: 70.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        decoration: BoxDecoration(
          color: (product.disponible) ? Colors.green : Colors.red,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            (product.disponible) ? 'Disponible' : 'No disponible',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _PriceTagWidget extends StatelessWidget {
  const _PriceTagWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 100.0,
        height: 70.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            '\$${product.precio}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _DetailsTagWidget extends StatelessWidget {
  const _DetailsTagWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 280.0,
        height: 70.0,
        decoration: const BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ListTile(
          title: Text(
            product.nombre,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          /*subtitle: Text(
            product.,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),*/
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: SizedBox(
        width: 400.0,
        height: 300.0,
        child: FadeInImage(
          placeholder: const AssetImage('assets/images/loading.gif'),
          image: NetworkImage(product.foto as String),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
