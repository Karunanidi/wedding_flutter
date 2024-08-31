import 'package:flutter/material.dart';

/// A function that builds a [PageView] lazily.
typedef PageView PageViewBuilder(
    BuildContext context, PageVisibilityResolver visibilityResolver);

/// A class that can be used to compute visibility information about
/// the current page.
class PageVisibilityResolver {
  PageVisibilityResolver({
    required ScrollMetrics metrics,
    required double viewPortFraction,
  })  : _pageMetrics = metrics,
        _viewPortFraction = viewPortFraction;

  final ScrollMetrics _pageMetrics;
  final double _viewPortFraction;

  /// Calculates visibility information for the page at [pageIndex].
  /// Used inside PageViews' itemBuilder, but can be also used in a
  /// simple PageView that simply has an array of children passed to it.
  PageVisibility resolvePageVisibility(int pageIndex) {
    final double pagePosition = _calculatePagePosition(pageIndex);
    final double visiblePageFraction =
        _calculateVisiblePageFraction(pageIndex, pagePosition);

    return PageVisibility(
      visibleFraction: visiblePageFraction,
      pagePosition: pagePosition,
    );
  }

  double _calculateVisiblePageFraction(int index, double pagePosition) {
    if (pagePosition > -1.0 && pagePosition <= 1.0) {
      return 1.0 - pagePosition.abs();
    }

    return 0.0;
  }

  double _calculatePagePosition(int index) {
    final double viewPortFraction = _viewPortFraction;
    final double pageViewWidth =
        _pageMetrics.viewportDimension * viewPortFraction;
    final double pageX = pageViewWidth * index;
    final double scrollX = _pageMetrics.pixels;
    final double pagePosition = (pageX - scrollX) / pageViewWidth;

    if (pagePosition.isNaN) {
      return 0.0;
    }

    return pagePosition.clamp(-1.0, 1.0);
  }
}

/// A class that contains visibility information about the current page.
class PageVisibility {
  PageVisibility({
    required this.visibleFraction,
    required this.pagePosition,
  });

  /// How much of the page is currently visible, between 0.0 and 1.0.
  final double visibleFraction;

  /// Tells the position of this page, relative to being visible in
  /// a "non-dragging" position, between -1.0 and 1.0.
  final double pagePosition;
}

/// A widget for getting useful information about a pages' position
/// and how much of it is visible in a PageView.
///
/// Note: Does not transform pages in any way, but provides the means
/// to easily do it, in the form of [PageVisibility].
class PageTransformer extends StatefulWidget {
  const PageTransformer({
    key,
    required this.pageViewBuilder,
  }) : super(key: key);

  final PageViewBuilder pageViewBuilder;

  @override
  State<PageTransformer> createState() => _PageTransformerState();
}

class _PageTransformerState extends State<PageTransformer> {
  late PageVisibilityResolver _visibilityResolver;

  @override
  Widget build(BuildContext context) {
    final pageView = widget.pageViewBuilder(context, _visibilityResolver);

    final controller = pageView.controller;
    final viewPortFraction = controller.viewportFraction;

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollUpdateNotification ||
            notification is ScrollEndNotification) {
          setState(() {
            _visibilityResolver = PageVisibilityResolver(
              metrics: notification.metrics,
              viewPortFraction: viewPortFraction,
            );
          });
        }
        return true;
      },
      child: pageView,
    );
  }

  @override
  void initState() {
    super.initState();
    _visibilityResolver = PageVisibilityResolver(
      metrics: FixedScrollMetrics(
        minScrollExtent: 0.0,
        maxScrollExtent: 0.0,
        pixels: 0.0,
        viewportDimension: 0.0,
        axisDirection: AxisDirection.right,
        devicePixelRatio: 1.0,
      ),
      viewPortFraction: 1.0,
    );
  }
}
