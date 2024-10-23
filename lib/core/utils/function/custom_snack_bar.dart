import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        textAlign: TextAlign.center,
        text,
        style: Styles.textStyle18,
      ),
    ),
  );
}
