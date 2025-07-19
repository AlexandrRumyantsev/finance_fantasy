import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/settings_provider.dart';
import '../../utils/app_localizations.dart';
import '../home/home.dart';

class PinAuthPage extends StatefulWidget {
  const PinAuthPage({super.key});

  @override
  State<PinAuthPage> createState() => _PinAuthPageState();
}

class _PinAuthPageState extends State<PinAuthPage> {
  final List<String> _pin = [];
  bool _isError = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    final colors = appColors ?? AppColors.light();

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Icon(
                Icons.lock_outline,
                size: 80,
                color: colors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)?.enterPinCode ?? 'Enter PIN Code',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)?.enterPinCodeDescription ??
                    'Enter 4-digit PIN code to access the app',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.unselectedButtonNavBar,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildPinDots(),
              const SizedBox(height: 40),
              _buildNumpad(),
              const Spacer(),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                TextButton(
                  onPressed: _onForgotPin,
                  child: Text(
                    AppLocalizations.of(context)?.forgotPinCode ??
                        'Forgot PIN code?',
                    style: TextStyle(color: colors.primary),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinDots() {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    final colors = appColors ?? AppColors.light();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < _pin.length;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _isError
                ? Colors.red
                : (isFilled ? colors.primary : colors.unselectedButtonNavBar),
          ),
        );
      }),
    );
  }

  Widget _buildNumpad() {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    final colors = appColors ?? AppColors.light();

    return Column(
      children: [
        for (int row = 0; row < 3; row++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int col = 1; col <= 3; col++)
                _buildNumberButton(
                  number: row * 3 + col,
                  appColors: colors,
                ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 80, height: 80),
            _buildNumberButton(number: 0, appColors: colors),
            _buildBackspaceButton(colors),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton({
    required int number,
    required AppColors appColors,
  }) {
    return InkWell(
      onTap: () => _onNumberPressed(number.toString()),
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appColors.surfaceContainer,
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: appColors.text,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(AppColors appColors) {
    return InkWell(
      onTap: _onBackspacePressed,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: appColors.surfaceContainer,
        ),
        child: Icon(
          Icons.backspace_outlined,
          color: appColors.text,
          size: 24,
        ),
      ),
    );
  }

  void _onNumberPressed(String number) {
    if (_isError) {
      setState(() {
        _isError = false;
        _pin.clear();
      });
    }

    setState(() {
      if (_pin.length < 4) {
        _pin.add(number);
      }
    });

    if (_pin.length == 4) {
      _verifyPin();
    }
  }

  void _onBackspacePressed() {
    setState(() {
      if (_pin.isNotEmpty) {
        _pin.removeLast();
      }
    });
  }

  Future<void> _verifyPin() async {
    setState(() {
      _isLoading = true;
    });

    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);
    final savedPin = await settingsProvider.getPinCode();

    await Future.delayed(const Duration(milliseconds: 500));

    if (mounted) {
      if (savedPin == _pin.join()) {
        // PIN верный, переходим в приложение
        await Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      } else {
        // PIN неверный
        setState(() {
          _isError = true;
          _isLoading = false;
        });

        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            setState(_pin.clear);
          }
        });
      }
    }
  }

  void _onForgotPin() {
    // Показываем диалог для сброса PIN-кода
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)?.resetPinCode ?? 'Reset PIN Code',
        ),
        content: Text(
          AppLocalizations.of(context)?.resetPinCodeDescription ??
              'To reset PIN code, you need to reinstall the app. All data will be deleted.',
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Здесь можно добавить логику для сброса PIN-кода
              // или перехода к настройкам
            },
            child: Text(AppLocalizations.of(context)?.reset ?? 'Reset'),
          ),
        ],
      ),
    );
  }
}
