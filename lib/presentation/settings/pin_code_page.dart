import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/app_localizations.dart';

class PinCodePage extends StatefulWidget {
  final bool isSetup;
  final Function(String)? onSuccess;
  final VoidCallback? onCancel;

  const PinCodePage({
    super.key,
    this.isSetup = false,
    this.onSuccess,
    this.onCancel,
  });

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final List<String> _pin = [];
  final List<String> _confirmPin = [];
  bool _isConfirming = false;
  bool _isError = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();

    // Fallback colors if AppColors is not available
    final colors = appColors ?? AppColors.light();

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        backgroundColor: colors.primary,
        foregroundColor: colors.text,
        title: Text(widget.isSetup
            ? (AppLocalizations.of(context)?.pinCodeSetup ?? 'PIN Code Setup')
            : (AppLocalizations.of(context)?.enterPinCode ?? 'Enter PIN Code')),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Icon(
                Icons.lock_outline,
                size: 80,
                color: colors.primary,
              ),
              const SizedBox(height: 24),
              Text(
                _getTitle(),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: colors.text,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                _getSubtitle(),
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
            ],
          ),
        ),
      ),
    );
  }

  String _getTitle() {
    final l10n = AppLocalizations.of(context);
    if (widget.isSetup) {
      return _isConfirming
          ? (l10n?.confirmPinCode ?? 'Confirm PIN Code')
          : (l10n?.createPinCode ?? 'Create PIN Code');
    }
    return l10n?.enterPinCode ?? 'Enter PIN Code';
  }

  String _getSubtitle() {
    final l10n = AppLocalizations.of(context);
    if (widget.isSetup) {
      return _isConfirming
          ? (l10n?.confirmPinCodeDescription ?? 'Repeat the entered PIN code')
          : (l10n?.createPinCodeDescription ??
              'Enter 4-digit PIN code to protect the app');
    }
    return l10n?.enterPinCodeDescription ?? 'Enter 4-digit PIN code';
  }

  Widget _buildPinDots() {
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>();
    final colors = appColors ?? AppColors.light();
    final currentPin = _isConfirming ? _confirmPin : _pin;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < currentPin.length;
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
        _confirmPin.clear();
        _isConfirming = false;
      });
    }

    setState(() {
      if (_isConfirming) {
        if (_confirmPin.length < 4) {
          _confirmPin.add(number);
        }
      } else {
        if (_pin.length < 4) {
          _pin.add(number);
        }
      }
    });

    _checkPinComplete();
  }

  void _onBackspacePressed() {
    setState(() {
      if (_isConfirming) {
        if (_confirmPin.isNotEmpty) {
          _confirmPin.removeLast();
        }
      } else {
        if (_pin.isNotEmpty) {
          _pin.removeLast();
        }
      }
    });
  }

  void _checkPinComplete() {
    if (_isConfirming) {
      if (_confirmPin.length == 4) {
        if (_pin.join() == _confirmPin.join()) {
          _onPinSuccess();
        } else {
          _onPinError();
        }
      }
    } else {
      if (_pin.length == 4) {
        if (widget.isSetup) {
          setState(() {
            _isConfirming = true;
          });
        } else {
          _onPinSuccess();
        }
      }
    }
  }

  void _onPinSuccess() {
    final pinCode = _pin.join();
    widget.onSuccess?.call(pinCode);
  }

  void _onPinError() {
    setState(() {
      _isError = true;
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(_confirmPin.clear);
      }
    });
  }
}
