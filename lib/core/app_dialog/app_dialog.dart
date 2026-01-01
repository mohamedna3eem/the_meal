import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.message,
    this.imageAsset,
    this.networkImageUrl,
    this.buttonText,
    this.onAction,
    this.backgroundColor,
    this.dismissible = true,
    this.imageHeight = 120,
  });

  final String message;

  final String? imageAsset;

  final String? networkImageUrl;

  final String? buttonText;
  final VoidCallback? onAction;
  final Color? backgroundColor;
  final bool dismissible;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? theme.colorScheme.primaryContainer;
    final btnText = buttonText ?? 'Done';

    return Dialog(
      backgroundColor: bg,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, size: 30, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),


            if (imageAsset != null)
              _buildAssetSvg(imageAsset!, imageHeight)
            else if (networkImageUrl != null)
              _buildNetworkImage(networkImageUrl!, imageHeight)
            else
              const Icon(Icons.info_outline, size: 100, color: Colors.white),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ),

            const SizedBox(height: 20),

            // Action button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onAction != null) onAction!();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(btnText)],
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  static Widget _buildAssetSvg(String assetName, double height) {
    final assetPath = 'assets/images/$assetName.svg';
    return SvgPicture.asset(
      assetPath,
      height: height,
      semanticsLabel: assetName,
      placeholderBuilder: (context) => SizedBox(
        height: height,
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  static Widget _buildNetworkImage(String url, double height) {
    final isSvg = url.toLowerCase().endsWith('.svg');

    if (isSvg) {
      // Svg from network
      return SvgPicture.network(
        url,
        height: height,
        semanticsLabel: url,
        placeholderBuilder: (context) => SizedBox(
          height: height,
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    } else {
      // Raster image (png/jpg/etc)
      return Image.network(
        url,
        height: height,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: height,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: height,
            child: const Center(child: Icon(Icons.broken_image, size: 64, color: Colors.white)),
          );
        },
      );
    }
  }

  /// Show dialog convenience method
  Future<T?> show<T>(BuildContext context) {
    return showDialog<T>(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => this,
    );
  }

  /// Factories for convenience
  factory AppDialog.success({
    required String message,
    String? imageAsset,
    String? networkImageUrl,
    String? buttonText,
    VoidCallback? onAction,
    Color? backgroundColor,
    bool dismissible = true,
  }) =>
      AppDialog(
        message: message,
        imageAsset: imageAsset,
        networkImageUrl: networkImageUrl,
        buttonText: buttonText,
        onAction: onAction,
        backgroundColor: backgroundColor,
        dismissible: dismissible,
      );

  factory AppDialog.error({
    required String message,
    String? imageAsset,
    String? networkImageUrl,
    String? buttonText,
    VoidCallback? onAction,
    Color? backgroundColor,
    bool dismissible = true,
  }) =>
      AppDialog(
        message: message,
        imageAsset: imageAsset,
        networkImageUrl: networkImageUrl,
        buttonText: buttonText,
        onAction: onAction,
        backgroundColor: backgroundColor,
        dismissible: dismissible,
      );

  factory AppDialog.soon({
    required String message,
    String? imageAsset,
    String? networkImageUrl,
    String? buttonText,
    VoidCallback? onAction,
    Color? backgroundColor,
    bool dismissible = true,
  }) =>
      AppDialog(
        message: message,
        imageAsset: imageAsset,
        networkImageUrl: networkImageUrl,
        buttonText: buttonText,
        onAction: onAction,
        backgroundColor: backgroundColor,
        dismissible: dismissible,
      );

  factory AppDialog.result({
    required String message,
    required bool isSuccess,
    String? imageAsset,
    String? networkImageUrl,
    String? buttonText,
    VoidCallback? onAction,
    Color? backgroundColor,
    bool dismissible = true,
  }) =>
      isSuccess
          ? AppDialog.success(
        message: message,
        imageAsset: imageAsset,
        networkImageUrl: networkImageUrl,
        buttonText: buttonText,
        onAction: onAction,
        backgroundColor: backgroundColor,
        dismissible: dismissible,
      )
          : AppDialog.error(
        message: message,
        imageAsset: imageAsset,
        networkImageUrl: networkImageUrl,
        buttonText: buttonText,
        onAction: onAction,
        backgroundColor: backgroundColor,
        dismissible: dismissible,
      );
}