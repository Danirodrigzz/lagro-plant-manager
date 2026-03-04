import 'package:flutter/material.dart';
import 'package:lagro_plant_manager/features/products/domain/entities/product.dart';
import 'package:lagro_plant_manager/core/theme/app_colors.dart';

class SalesSparkline extends StatelessWidget {
  final List<Sale> sales;
  final double height;
  final double width;

  const SalesSparkline({
    super.key,
    required this.sales,
    this.height = 30,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    if (sales.isEmpty) return const SizedBox.shrink();

    // Sort sales by date to ensure the sparkline is chronological
    final sortedSales = List<Sale>.from(sales)
      ..sort((a, b) => a.soldAt.compareTo(b.soldAt));

    // Get only the quantities for the sparkline
    final data = sortedSales.map((s) => s.quantity.toDouble()).toList();

    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: _SparklinePainter(
          data: data,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color color;

  _SparklinePainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.length < 2) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    
    final double min = data.reduce((a, b) => a < b ? a : b);
    final double max = data.reduce((a, b) => a > b ? a : b);
    final double range = max - min == 0 ? 1 : max - min;

    final double stepX = size.width / (data.length - 1);
    
    for (int i = 0; i < data.length; i++) {
      final double x = i * stepX;
      // Invert Y because canvas Y grows downwards
      final double normalizedY = (data[i] - min) / range;
      final double y = size.height - (normalizedY * size.height);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    // Add a subtle gradient fill under the line
    final fillPath = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) =>
      oldDelegate.data != data;
}
