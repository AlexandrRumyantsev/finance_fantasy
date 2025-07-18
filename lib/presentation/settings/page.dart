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
          const CommonFinanceAppBar(
            title: 'Настройки',
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSection(
                  context,
                  'Внешний вид',
                  [
                    _buildThemeTile(context, themeProvider),
                    _buildColorTile(context, themeProvider),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  'Безопасность',
                  [
                    _buildPinCodeTile(context, settingsProvider),
                    if (settingsProvider.isBiometricAvailable)
                      _buildBiometricTile(context, settingsProvider),
                  ],
                ),
                const SizedBox(height: 24),
                _buildSection(
                  context,
                  'Интерфейс',
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

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
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
      title: const Text('Тема'),
      subtitle: Text(_getThemeSubtitle(themeProvider.themeMode)),
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
      title: const Text('Основной цвет'),
      subtitle: const Text('Выберите цвет приложения'),
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

  Widget _buildPinCodeTile(BuildContext context, SettingsProvider settingsProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    return ListTile(
      leading: Icon(Icons.lock_outline, color: appColors.primary),
      title: const Text('PIN-код'),
      subtitle: const Text('Защита приложения'),
      trailing: Icon(Icons.chevron_right, color: appColors.chevronRight),
      onTap: () => _showPinCodeDialog(context, settingsProvider),
    );
  }

  Widget _buildBiometricTile(BuildContext context, SettingsProvider settingsProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    return ListTile(
      leading: Icon(Icons.fingerprint, color: appColors.primary),
      title: const Text('Биометрия'),
      subtitle: const Text('Face ID / Touch ID'),
      trailing: Switch(
        value: settingsProvider.biometricEnabled,
        onChanged: settingsProvider.setBiometricEnabled,
      ),
    );
  }

  Widget _buildHapticTile(BuildContext context, SettingsProvider settingsProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    return ListTile(
      leading: Icon(Icons.vibration, color: appColors.primary),
      title: const Text('Хаптики'),
      subtitle: const Text('Тактильная обратная связь'),
      trailing: Switch(
        value: settingsProvider.hapticEnabled,
        onChanged: settingsProvider.setHapticEnabled,
      ),
    );
  }

  Widget _buildLanguageTile(BuildContext context, SettingsProvider settingsProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    return ListTile(
      leading: Icon(Icons.language, color: appColors.primary),
      title: const Text('Язык'),
      subtitle: Text(_getLanguageSubtitle(settingsProvider.language)),
      trailing: Icon(Icons.chevron_right, color: appColors.chevronRight),
      onTap: () => _showLanguageDialog(context, settingsProvider),
    );
  }

  String _getThemeSubtitle(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return 'Светлая';
      case ThemeMode.dark:
        return 'Темная';
      case ThemeMode.system:
        return 'Системная';
    }
  }

  String _getLanguageSubtitle(String language) {
    switch (language) {
      case 'ru':
        return 'Русский';
      case 'en':
        return 'English';
      default:
        return 'Русский';
    }
  }

  void _showThemeDialog(BuildContext context, ThemeProvider themeProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title: const Text('Выберите тему'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('Системная'),
              value: ThemeMode.system,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                themeProvider.setThemeMode(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Светлая'),
              value: ThemeMode.light,
              groupValue: themeProvider.themeMode,
              onChanged: (value) {
                themeProvider.setThemeMode(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Темная'),
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
        title: const Text('Выберите цвет'),
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
              'Готово',
              style: TextStyle(color: appColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  void _showPinCodeDialog(BuildContext context, SettingsProvider settingsProvider) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PinCodePage(
          isSetup: true,
          onSuccess: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('PIN-код установлен')),
            );
          },
          onCancel: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context, SettingsProvider settingsProvider) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: appColors.surfaceContainer,
        title: const Text('Выберите язык'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<String>(
              title: const Text('Русский'),
              value: 'ru',
              groupValue: settingsProvider.language,
              onChanged: (value) {
                settingsProvider.setLanguage(value!);
                Navigator.of(context).pop();
              },
            ),
            RadioListTile<String>(
              title: const Text('English'),
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
