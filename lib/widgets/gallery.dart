import 'package:flutter/material.dart';
import 'package:invitation/core/constant.dart';
import 'package:invitation/model/image.dart';
import 'package:invitation/widgets/image_card.dart';
import 'package:invitation/widgets/page_transformer.dart';

class Gallery extends StatelessWidget {
  const Gallery({Key? key}) : super(key: key);

  Widget _buildImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Image.asset(
        img_flower,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitleText() {
    return Container(
      child: const Text(
        'Galeri',
        style: TextStyle(
          color: Color(0x9C295238),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(context),
        _buildTitleText(),
        const SizedBox(height: 50.0),
        SizedBox.fromSize(
          size: const Size.fromHeight(500.0),
          child: PageTransformer(
            pageViewBuilder: (context, visibilityResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: imageItems.length,
                itemBuilder: (context, index) {
                  final item = imageItems[index];
                  final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);

                  return ImageCardItem(
                    item: item,
                    pageVisibility: pageVisibility,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
