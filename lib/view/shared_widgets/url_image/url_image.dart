import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kabaten/view/shared_widgets/center_progress.dart';

class UrlImage extends StatelessWidget {
  final String url;
  final Widget placeholder;
  final Widget errorWidget;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const UrlImage({
    Key? key,
    required this.url,
    this.placeholder = const CenterProgress(),
    this.errorWidget = const SizedBox.shrink(),
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => errorWidget,
        width: width,
        height: height,
        fit: fit,
      );
}
