import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class ProductData {
  final String product;
  final int value;

  ProductData(this.product, this.value);
}

class GraphicScreen extends StatefulWidget {
  const GraphicScreen({super.key});

  @override
  State<GraphicScreen> createState() => _GraphicScreenState();
}

class _GraphicScreenState extends State<GraphicScreen> {
  final List<ProductData> data = [
    ProductData('Produto A', 30),
    ProductData('Produto B', 10),
    ProductData('Produto C', 60),
    ProductData('Produto D', 60),
    ProductData('Produto E', 60),
  ];

  final List<int> colors = [
    0xFFFFA41D1A,
    0xFFFF293757,
    0xFFFF568D4B,
    0xFFFFD5BB56,
    0xFFFFD26A1B,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.red],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                transform: const GradientRotation(1),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                children: [
                  const Text(
                    'Estoque',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  for (int i = 0; i < data.length; i++)
                    ProductTable(
                      data: data,
                      count: i,
                      colors: colors,
                    ),
                  Container(
                    height: 40,
                  ),
                  Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: CustomPaint(
                      painter: GraphicPainter(data, colors),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        data.length * 30 -
                        540,
                  ),
                  TextButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green.shade900,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 1),
                      child: Text('Voltar'),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductTable extends StatelessWidget {
  final List<ProductData> data;
  final int count;
  final List<int> colors;

  const ProductTable(
      {super.key,
      required this.data,
      required this.count,
      required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Color(colors[count]),
              ),
              margin: const EdgeInsets.only(left: 10, right: 10),
            ),
            Text(
              data[count].product,
              textAlign: TextAlign.left,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            Container(
              height: 30,
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            '${data[count].value}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class GraphicPainter extends CustomPainter {
  final List<ProductData> data;
  final double total;
  final List<int> colors;

  GraphicPainter(this.data, this.colors)
      : total = data
            .map((ProductData products) => products.value.toDouble())
            .reduce((a, b) => a + b);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);

    int i = 0;
    double startAngle = 0;

    for (var products in data) {
      final sweepAngle = (products.value / total) * 2 * pi;

      final paint = Paint()
        ..color = Color(colors[i]).withOpacity(1.0)
        ..style = PaintingStyle.fill;

      canvas.drawArc(
        Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      i++;
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
