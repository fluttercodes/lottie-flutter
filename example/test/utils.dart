import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FilmStrip extends StatelessWidget {
  final LottieComposition composition;
  final Size size;

  const FilmStrip(this.composition, {Key key, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: _CustomerPainter(composition),
    );
  }
}

class _CustomerPainter extends CustomPainter {
  static const _columns = 5;
  final LottieComposition composition;

  _CustomerPainter(this.composition);

  @override
  void paint(Canvas canvas, Size size) {
    var thumbSize = Size(size.width / _columns, size.width / _columns);
    var drawable = LottieDrawable(composition);

    var index = 0;
    for (var progress = 0.0; progress <= 1; progress += 0.05) {
      var x = index % _columns;
      var y = index ~/ _columns;

      var rect = Offset(x * thumbSize.width, y.toDouble() * thumbSize.height) &
          thumbSize;

      drawable
        ..setProgress(progress)
        ..draw(canvas, rect);

      ++index;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}