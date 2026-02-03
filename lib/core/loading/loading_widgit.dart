import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_meal/core/loading/loading_error.dart';
import 'package:the_meal/core/loading/loading_states.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.loadingState,
    required this.child,
    this.loadingWidget,
    required this.onRetry,
    this.emptyImagePath = "",
    this.emptyTitle = "",
    this.emptyWidget,
  });

  final Widget child;
  final Widget? loadingWidget;
  final LoadingState loadingState;
  final void Function() onRetry;
  final String emptyImagePath;
  final String emptyTitle;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return switch (loadingState) {
      // Show child content during loading (global loader will handle the visual feedback)
      Loading(showSuccessWidget: true) => _baseWidget(child),
      Loading() => Center(
        child: loadingWidget ?? const CircularProgressIndicator(),
      ), // Hide during initial load (global loader shows)
      Idle() => const SizedBox(),
      LoadingSuccess(data: final data) =>
        !_isDataNotEmpty(data)
            ? emptyWidget ?? _emptyWidget()
            : _baseWidget(child),
      LoadingException(exception: final exception) => LoadingErrorWidget(
        exception: exception,
        onRetry: onRetry,
      ),
    };
  }

  Widget _baseWidget(Widget stateRelatedWidget) {
    return SizedBox(width: double.infinity, child: stateRelatedWidget);
  }

  bool _isDataNotEmpty(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is List && data.isEmpty) {
      return false;
    }
    return true;
  }

  Widget _emptyWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        emptyImagePath.isNotEmpty
            ? SvgPicture.asset(
                emptyImagePath,
                height: 120,
                placeholderBuilder: (_) => const Icon(Icons.inbox, size: 80),
              )
            : const Icon(Icons.inbox, size: 80),
        const SizedBox(height: 30),
        Text(emptyTitle.isNotEmpty ? emptyTitle : 'No data found'),
      ],
    );
  }
}
