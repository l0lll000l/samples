import 'package:Portfolio/Utils/constants/colors.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/Utils/loaders/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

class XdeviceFrame extends StatefulWidget {
  const XdeviceFrame({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.imageurl,
    this.applyImageRadius = false,
    this.border,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.backGroundColor = TColors.light,
    this.borderRadius = TSizes.md,
    this.imageradius = TSizes.md,
    this.nocacheNetworkImage = false,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final Color backGroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double imageradius;
  final bool nocacheNetworkImage;

  @override
  State<XdeviceFrame> createState() => _XdeviceFrameState();
}

class _XdeviceFrameState extends State<XdeviceFrame> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: Container(
            height: widget.height,
            width: widget.width,
            padding: widget.padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: widget.border,
                color: widget.backGroundColor),
            child: DeviceFrame(
              device: Devices.ios.iPhone13ProMax,
              isFrameVisible: true,
              orientation: Orientation.portrait,
              screen: Container(
                height: double.infinity,
                child: CachedNetworkImage(
                    fit: widget.fit,
                    imageUrl: widget.imageurl,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const TShimmerEffect(
                          width: double.infinity,
                          height: 190,
                          radius: 15,
                        ),
                    errorWidget: (context, url, error) {
                      print(error);
                      return const Icon(Icons.error);
                    }),
              ),
            )));
  }
}
