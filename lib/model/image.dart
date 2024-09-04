import 'package:invitation/core/constant.dart';

class ImageItem {
  ImageItem({
    required this.imageUrl,
  });

  final String imageUrl;
}

final imageItems = <ImageItem>[
  ImageItem(
    imageUrl: img_gallery1,
  ),
  ImageItem(
    imageUrl: img_gallery2,
  ),
  ImageItem(
    imageUrl: img_gallery3,
  ),
  ImageItem(
    imageUrl: img_gallery4,
  ),
];