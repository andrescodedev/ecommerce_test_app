import 'package:flutter/material.dart';

class CustomSnackBarWidget extends SnackBar {
  CustomSnackBarWidget({
    Key? key,
    required this.snackbarMessage,
    this.iconMessage,
    this.iconMessageColor,
  }) : super(
          key: key,
          content: Row(
            children: [
              Icon(
                iconMessage,
                color: iconMessageColor,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                snackbarMessage,
              ),
            ],
          ),
        );

  final String snackbarMessage;
  final IconData? iconMessage;
  final Color? iconMessageColor;
}
