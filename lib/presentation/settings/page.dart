part of 'settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Переключение темы')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SwitchListTile(
          title: const Text('Тёмная тема'),
          value: isDark,
          onChanged: themeProvider.toggleTheme,
        ),
      ),
    );
  }
}
