library merge_images_function;

import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'dart:typed_data';
import 'dart:convert';
import 'dart:core';

class MergeImage
{
  MergeImage();
  Future<String> mergeImage(
  {
    required Uint8List imageFront,
    required Uint8List imageBack,
    int? resizeHeightImageFront,
    int? resizeWidthImageFront,
    int? resizeHeightImageBack,
    int? resizeWidthImageBack
  }) async
  {
    String? pictures;
    try
    {
      final decodedImageFront = image.decodeImage(imageFront);
      final decodedImageBack = image.decodeImage(imageBack);
      final resizedImageFront = image.copyResize(decodedImageFront!, height: resizeHeightImageFront!, width: resizeWidthImageFront!);
      final resizedImageBack = image.copyResize(decodedImageBack!, height: resizeHeightImageBack!, width: resizeWidthImageBack!);
      final mergedImage = image.copyInto(resizedImageBack, resizedImageFront);
      pictures = base64Encode(image.encodePng(mergedImage));
    }
    catch (error)
    {
      debugPrint(error.toString());
    }
    return pictures!;
  }
}