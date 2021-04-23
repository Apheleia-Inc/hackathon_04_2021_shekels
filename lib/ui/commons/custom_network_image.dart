import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;
  final Widget errorWidget;

  const CustomNetworkImage({
    Key key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String imgURL = this.imageUrl ?? '';

    if (imgURL == '') {
      return Image.asset(
        'assets/images/miscs/default-image.jpg',
        width: this.width,
        height: this.height,
        fit: this.fit,
      );
    }

    return CachedNetworkImage(
      imageUrl: imgURL,
      width: this.width,
      height: this.height,
      fit: this.fit,
      placeholder: (context, url) {
        return Image.asset(
          'assets/images/miscs/default-image.jpg',
          width: this.width,
          height: this.height,
          fit: this.fit,
        );
      },
      errorWidget: (context, url, error) => this.errorWidget == null
          ? Image.asset(
              'assets/images/miscs/default-image.jpg',
              width: this.width,
              height: this.height,
              fit: this.fit,
            )
          : this.errorWidget,
    );
  }
}
