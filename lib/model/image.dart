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
    imageUrl: 'https://images.unsplash.com/photo-1524675053444-52c3ca294ad2?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
  ImageItem(
    imageUrl: 'https://images.unsplash.com/photo-1710609951346-cfc8a9cb1b82?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ),
];