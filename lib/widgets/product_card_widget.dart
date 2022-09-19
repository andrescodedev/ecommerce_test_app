import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

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
        children: const [
          _BackgroundImage(),
          _DetailsTagWidget(),
          _PriceTagWidget(),
          _AvailableTagWidget(),
        ],
      ),
    );
  }
}

class _AvailableTagWidget extends StatelessWidget {
  const _AvailableTagWidget({
    Key? key,
  }) : super(key: key);

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
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'No disponible',
            style: TextStyle(
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
  }) : super(key: key);

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
        child: const FittedBox(
          fit: BoxFit.contain,
          child: Text(
            '\$325.520.000',
            style: TextStyle(
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
  }) : super(key: key);

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
        child: const ListTile(
          title: Text(
            'Nombre del producto',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'Descripción del producto',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: const SizedBox(
        width: 400.0,
        height: 300.0,
        child: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'),
          image: AssetImage('assets/images/no-image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
