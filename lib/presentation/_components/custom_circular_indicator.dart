part of 'components.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return CircularProgressIndicator(
      color: appColors.primary,
      strokeWidth: 5,
    );
  }
}
