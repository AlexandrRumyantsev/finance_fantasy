// ignore_for_file: use_build_context_synchronously, lines_longer_than_80_chars

part of 'settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final appColors = Theme.of(context).extension<AppColors>()!;

    return Scaffold(
      backgroundColor: appColors.background,
      body: CustomScrollView(
        slivers: [
          CommonFinanceAppBar(
            title: AppLocalizations.of(context)?.settings ?? 'Settings',
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSection(
                  context,
                  AppLocalizations.of(context)?.appearance ?? 'Appearance',
                  [
                    _buildThemeTile(context, themeProvider),
                    _buildColorTile(context, themeProvider),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  AppLocalizations.of(context)?.security ?? 'Security',
                  [
                    _buildPinCodeTile(context, settingsProvider),
                    if (settingsProvider.isBiometricAvailable)
                      _buildBiometricTile(context, settingsProvider),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  AppLocalizations.of(context)?.interface ?? 'Interface',
                  [
                    _buildHapticTile(context, settingsProvider),
                    _buildLanguageTile(context, settingsProvider),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              color: appColors.unselectedButtonNavBar,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: appColors.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildThemeTile(BuildContext context, ThemeProvider themeProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListTile(
      leading: Icon(Icons.brightness_6, color: appColors.primary),
      title: Text(AppLocalizations.of(context)?.theme ?? 'Theme'),
      subtitle: Text(_getThemeSubtitle(context, themeProvider.themeMode)),
      trailing: Switch(
        value: themeProvider.themeMode == ThemeMode.system,
        onChanged: (value) {
          themeProvider.setThemeMode(
            value ? ThemeMode.system : ThemeMode.light,
          );
        },
      ),
      onTap: () => _showThemeDialog(context, themeProvider),
    );
  }

  Widget _buildColorTile(BuildContext context, ThemeProvider themeProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListTile(
      leading: Icon(Icons.palette, color: appColors.primary),
      title:
          Text(AppLocalizations.of(context)?.primaryColor ?? 'Primary color'),
      subtitle: Text(
        AppLocalizations.of(context)?.primaryColorDescription ??
            'Choose app color',
      ),
      trailing: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: themeProvider.primaryColor,
          shape: BoxShape.circle,
          border: Border.all(color: appColors.divider),
        ),
      ),
      onTap: () => _showColorPicker(context, themeProvider),
    );
  }

  Widget _buildPinCodeTile(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return FutureBuilder<bool>(
      future: settingsProvider.isPinCodeSet(),
      builder: (context, snapshot) {
        final isPinSet = snapshot.data ?? false;

        return ListTile(
          leading: Icon(Icons.lock_outline, color: appColors.primary),
          title: Text(AppLocalizations.of(context)?.pinCode ?? 'PIN Code'),
          subtitle: Text(
            isPinSet
                ? (AppLocalizations.of(context)?.pinCodeSet ?? 'PIN code set')
                : (AppLocalizations.of(context)?.pinCodeDescription ??
                    'App protection'),
          ),
          trailing: isPinSet
              ? Switch(
                  value: true,
                  onChanged: (value) =>
                      _showDisablePinDialog(context, settingsProvider),
                )
              : Icon(Icons.chevron_right, color: appColors.chevronRight),
          onTap: () => _showPinCodeDialog(context, settingsProvider),
        );
      },
    );
  }

  Widget _buildBiometricTile(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListTile(
      leading: Icon(Icons.fingerprint, color: appColors.primary),
      title: Text(AppLocalizations.of(context)?.biometric ?? 'Biometric'),
      subtitle: Text(
        AppLocalizations.of(context)?.biometricDescription ??
            'Face ID / Touch ID',
      ),
      trailing: Switch(
        value: settingsProvider.biometricEnabled,
        onChanged: settingsProvider.setBiometricEnabled,
      ),
    );
  }

  Widget _buildHapticTile(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListTile(
      leading: Icon(Icons.vibration, color: appColors.primary),
      title: Text(AppLocalizations.of(context)?.haptic ?? 'Haptic'),
      subtitle: Text(
        AppLocalizations.of(context)?.hapticDescription ?? 'Tactile feedback',
      ),
      trailing: Switch(
        value: settingsProvider.hapticEnabled,
        onChanged: settingsProvider.setHapticEnabled,
      ),
    );
  }

  Widget _buildLanguageTile(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return ListTile(
      leading: Icon(Icons.language, color: appColors.primary),
      title: Text(AppLocalizations.of(context)?.language ?? 'Language'),
      subtitle: Text(_getLanguageSubtitle(context, settingsProvider.language)),
      trailing: Icon(Icons.chevron_right, color: appColors.chevronRight),
      onTap: () => _showLanguageDialog(context, settingsProvider),
    );
  }

  String _getThemeSubtitle(BuildContext context, ThemeMode themeMode) {
    final l10n = AppLocalizations.of(context);
    switch (themeMode) {
      case ThemeMode.light:
        return l10n?.themeLight ?? 'Light';
      case ThemeMode.dark:
        return l10n?.themeDark ?? 'Dark';
      case ThemeMode.system:
        return l10n?.themeSystem ?? 'System';
    }
  }

  String _getLanguageSubtitle(BuildContext context, String language) {
    final l10n = AppLocalizations.of(context);
    switch (language) {
      case 'ru':
        return l10n?.russian ?? 'Русский';
      case 'en':
        return l10n?.english ?? 'English';
      default:
        return l10n?.russian ?? 'Русский';
    }
  }

  void _showThemeDialog(BuildContext context, ThemeProvider themeProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title:
            Text(AppLocalizations.of(context)?.selectTheme ?? 'Select theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title:
                  Text(AppLocalizations.of(context)?.themeSystem ?? 'System'),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                themeProvider.setThemeMode(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text(AppLocalizations.of(context)?.themeLight ?? 'Light'),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                themeProvider.setThemeMode(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<ThemeMode>(
              title: Text(AppLocalizations.of(context)?.themeDark ?? 'Dark'),
              value: ThemeMode.dark,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                themeProvider.setThemeMode(value!);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPicker(BuildContext context, ThemeProvider themeProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title:
            Text(AppLocalizations.of(context)?.selectColor ?? 'Select color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: themeProvider.primaryColor,
            onColorChanged: (color) {
              themeProvider.setPrimaryColor(color);
            },
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppLocalizations.of(context)?.done ?? 'Done',
              style: TextStyle(color: appColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _showPinCodeDialog(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PinCodePage(
          key: const ValueKey('pin_code_page'),
          isSetup: true,
          onSuccess: (pinCode) async {
            await settingsProvider.setPinCode(pinCode);
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  AppLocalizations.of(context)?.pinCodeSetSuccess ??
                      'PIN code set',
                ),
              ),
            );
          },
          onCancel: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _showDisablePinDialog(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title: Text(
          AppLocalizations.of(context)?.disablePinCode ?? 'Disable PIN Code',
        ),
        content: Text(
          AppLocalizations.of(context)?.disablePinCodeConfirm ??
              'Are you sure you want to disable PIN code? The app will no longer require PIN code entry on startup.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppLocalizations.of(context)?.cancel ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () async {
              await settingsProvider.removePinCode();
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    AppLocalizations.of(context)?.pinCodeDisabled ??
                        'PIN code disabled',
                  ),
                ),
              );
            },
            child: Text(
              AppLocalizations.of(context)?.delete ?? 'Delete',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(
    BuildContext context,
    SettingsProvider settingsProvider,
  ) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title: Text(
          AppLocalizations.of(context)?.selectLanguage ?? 'Select language',
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: Text(AppLocalizations.of(context)?.russian ?? 'Русский'),
              value: 'ru',
              groupValue: settingsProvider.language,
              onChanged: (value) {
                settingsProvider.setLanguage(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<String>(
              title: Text(AppLocalizations.of(context)?.english ?? 'English'),
              value: 'en',
              groupValue: settingsProvider.language,
              onChanged: (value) {
                settingsProvider.setLanguage(value!);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
