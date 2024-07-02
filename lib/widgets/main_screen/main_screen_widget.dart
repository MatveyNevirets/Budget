import 'package:budget/Consts/AppColors.dart';
import 'package:budget/Consts/AppStrings.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatelessWidget {
  const MainScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundBodyColor,
      appBar: AppBar(
        title: const Text(
          AppStrings.appBarTitleText,
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: const TitleAndNavigationWidgets(),
    );
  }
}

class TitleAndNavigationWidgets extends StatelessWidget {
  static const double ovalRadius = 22.5;
  static const double indentOfOvalToLine = ovalRadius / 5.625;
  static const Color categoryWidgetsColor = AppColors.categoryWidgetsColor;
  static const Color alternativeCategoryWidgetsColor =
      AppColors.alternativeCategoryWidgetsColor;

  const TitleAndNavigationWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(parent: ClampingScrollPhysics()),
      child: Container(
        margin: const EdgeInsets.all(30),
        child: const Wrap(
          children: [
            Column(
              children: [
                Text(AppStrings.subtitleText),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    categoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    false,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 38,
                ),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    alternativeCategoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    false,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 38,
                ),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    categoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    false,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 38,
                ),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    alternativeCategoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    false,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 38,
                ),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    categoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    false,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 38,
                ),
                OneCategoryGraphicWidgets(
                    // радиус 10, отступ от круга до линии 20
                    alternativeCategoryWidgetsColor,
                    AppStrings.whatIsBudgetButtonText,
                    true,
                    ovalRadius,
                    indentOfOvalToLine),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OneCategoryGraphicWidgets extends StatelessWidget {
  final Color baseColor;
  final String textOfCategory;
  final bool isEndPoint;
  final double ovalRadius;
  final double indentOfOvalToLine;

  const OneCategoryGraphicWidgets(this.baseColor, this.textOfCategory,
      this.isEndPoint, this.ovalRadius, this.indentOfOvalToLine,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  CustomPaint(
                    painter: DrawingCirclePainter(baseColor, ovalRadius),
                  ),
                  CheckIsEndPoint(
                      isEndPoint, baseColor, ovalRadius, indentOfOvalToLine),
                ],
              ),
              const SizedBox(
                width: 70,
                height: 0,
                child: ColoredBox(
                  color: Colors.black,
                ),
              ), //Здесь можно текст двигать
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 0,
                    height: 135,
                    child: ColoredBox(
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    child: Text(
                      textOfCategory,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(AppStrings.basicCheckButtonText),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CheckIsEndPoint extends StatelessWidget {
  final bool isEndPoint;
  final Color baseColor;
  final double ovalRadius;
  final double indentOfOvalToLine;

  CheckIsEndPoint(this.isEndPoint, this.baseColor, this.ovalRadius,
      this.indentOfOvalToLine);

  @override
  Widget build(BuildContext context) {
    if (!isEndPoint) {
      return CustomPaint(
        painter: DrawingLinesPainter(baseColor, ovalRadius, indentOfOvalToLine),
      );
    } else {
      return SizedBox();
    }
  }
}

class DrawingCirclePainter extends CustomPainter {
  final Color widgetColor;
  final double widgetRadius;

  DrawingCirclePainter(this.widgetColor, this.widgetRadius);

  @override
  void paint(Canvas canvas, Size size) {
    final paintr = Paint()
      ..strokeWidth = 4
      ..color = widgetColor
      ..style = PaintingStyle.fill;

    canvas.drawOval(
        Rect.fromCircle(center: const Offset(20, 20), radius: widgetRadius),
        paintr);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawingLinesPainter extends CustomPainter {
  Color widgetColor;
  double ovalRadius;
  double indentOfOvalToLine;

  DrawingLinesPainter(
      this.widgetColor, this.ovalRadius, this.indentOfOvalToLine);

  @override
  void paint(Canvas canvas, Size size) {
    final paintr = Paint()
      ..strokeWidth = 0.3 * ovalRadius
      ..color = widgetColor
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
        Offset(
            20,
            indentOfOvalToLine *
                ovalRadius /
                (indentOfOvalToLine * ovalRadius / 52.9)),
        Offset(20, ovalRadius * 6 * (ovalRadius * 6 / 80)),
        paintr);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
