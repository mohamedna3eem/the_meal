import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({
    super.key,
    required this.exception,
    required this.onRetry,
  });

  final NetworkException exception;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/error.svg", width: 64, height: 64),
          const SizedBox(height: 32),
          Text("unexpected_error", textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(exception.message, textAlign: TextAlign.center),
          const SizedBox(height: 42),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: FittedBox(fit: BoxFit.scaleDown, child: Text("retry")),
          ),
        ],
      ),
    );
  }
}
