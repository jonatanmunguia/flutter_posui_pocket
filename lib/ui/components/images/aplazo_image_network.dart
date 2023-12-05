import 'package:flutter/cupertino.dart';

class AplazoImageNetwork extends StatelessWidget {
  const AplazoImageNetwork({super.key, required this.imageNetworkProps});

  final ImageNetworkProps imageNetworkProps;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(imageNetworkProps.borderRadius),
      child: imageNetworkProps.withVisibleLoader ? Image.network(
        imageNetworkProps.image,
        loadingBuilder: (context, widget, _) =>
            Image.asset(imageNetworkProps.placeHolder),
        errorBuilder: (context, object, _) =>
            Image.asset(imageNetworkProps.error, fit: BoxFit.fitWidth),
        fit: imageNetworkProps.boxFit,
      ) : FadeInImage(
        placeholder: AssetImage(imageNetworkProps.placeHolder),
        image: NetworkImage(imageNetworkProps.image),
        imageErrorBuilder: (context, error, stackTrace) =>
            Image.asset(imageNetworkProps.error, fit: BoxFit.fitWidth),
        fit: imageNetworkProps.boxFit,
      ),
    );
  }
}

class ImageNetworkProps {
  String image;
  String placeHolder;
  String error;
  BoxFit boxFit;
  double borderRadius;
  bool withVisibleLoader;

  ImageNetworkProps(
      {required this.image,
      this.placeHolder = 'assets/gifs/loader_store.gif',
      this.error = 'assets/images/home/main/merchants/empty_image.png',
      this.borderRadius = 10,
      this.withVisibleLoader = false,
      this.boxFit = BoxFit.fill});
}
