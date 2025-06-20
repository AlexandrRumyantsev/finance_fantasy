part of 'components.dart';

class CustomDivider extends StatelessWidget {
  /// Смещение слева
  final double leftPadding;

  /// Смещение справа
  final double rightPadding;

  /// Смещение сверху
  final double topPadding;

  /// Смещение снизу
  final double bottomPadding;

  /// Отображать ли виджет
  final bool isVisible;

  /// Цвет
  final Color? color;

  /// Вертикальный
  final bool isVertical;

  /// Толщина
  final double? thickness;

  const CustomDivider({
    super.key,
    this.leftPadding = 0,
    this.rightPadding = 0,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.isVisible = true,
    this.color,
    this.isVertical = false,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.only(
          left: leftPadding,
          right: rightPadding,
          top: topPadding,
          bottom: bottomPadding,
        ),
        child: isVertical
            ? VerticalDivider(
          color: color,
          width: thickness ?? 1,
          thickness: thickness ?? 1,
        )
            : Divider(
          color: color,
          height: thickness ?? 1,
          thickness: thickness ?? 1,
        ),
      ),
    );
  }
}
