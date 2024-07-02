import 'package:budget/Consts/AppColors.dart';
import 'package:budget/Consts/AppStrings.dart';
import 'package:budget/widgets/main_screen/main_screen_widget.dart';
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
        child: Wrap(
          children: [
            Column(
              children: [
                Text(AppStrings.subtitleText),
                CategoryPoint(
                    AppStrings.whatIsBudgetButtonText,
                    AppColors.categoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, false),
                SizedBox(
                  height: 48,
                ),
                CategoryPoint(
                    AppStrings.baseCharactersButtonText,
                    AppColors.alternativeCategoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, false),
                SizedBox(
                  height: 48,
                ),
                CategoryPoint(
                    AppStrings.dohods,
                    AppColors.categoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, false),
                SizedBox(
                  height: 48,
                ),
                CategoryPoint(
                    AppStrings.meshBudget,
                    AppColors.alternativeCategoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, false),
                SizedBox(
                  height: 48,
                ),
                CategoryPoint(
                    AppStrings.requesits,
                    AppColors.categoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, false),
                SizedBox(
                  height: 48,
                ),
                CategoryPoint(
                    AppStrings.contacts,
                    AppColors.alternativeCategoryWidgetsColor,
                    ovalRadius,
                    indentOfOvalToLine, true),
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

class CategoryPoint extends StatelessWidget {

  final String textOfCategory;

  final Color basedColor;
  final double ovalRadius;
  final double indentOfOvalToLine;

  final bool isEndPoint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OneCategoryGraphicWidgets(
            // радиус 10, отступ от круга до линии 20
            basedColor,
            isEndPoint,
            ovalRadius,
            indentOfOvalToLine),
        SizedBox(width: 60,),
        OneCategoryUIWidgets(textOfCategory: textOfCategory),
      ],
    );
  }


  CategoryPoint(this.textOfCategory, this.basedColor, this.ovalRadius,
      this.indentOfOvalToLine, this.isEndPoint);
}

class OneCategoryUIWidgets extends StatelessWidget {
  final String textOfCategory;

  const OneCategoryUIWidgets({super.key, required this.textOfCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100
        ),
        Container(
          child: Text(
            textOfCategory,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 15, width: 21,),
        ElevatedButton(
          onPressed: () {},
          child: Text(AppStrings.basicCheckButtonText),
        ),
      ],
    );
  }
}

class OneCategoryGraphicWidgets extends StatelessWidget {
  final Color baseColor;
  final bool isEndPoint;
  final double ovalRadius;
  final double indentOfOvalToLine;

  const OneCategoryGraphicWidgets(
      this.baseColor, this.isEndPoint, this.ovalRadius, this.indentOfOvalToLine,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              CustomPaint(
                painter: DrawingCirclePainter(baseColor, ovalRadius),
              ),
              CheckIsEndPoint(
                  isEndPoint, baseColor, ovalRadius, indentOfOvalToLine),
            ],
          ),
          const SizedBox(
            width: 8,
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
