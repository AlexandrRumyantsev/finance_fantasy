part of '../components.dart';

class AmountInputModal extends StatefulWidget {
  const AmountInputModal({
    super.key,
    required this.initialValue,
  });

  final String initialValue;

  @override
  State<AmountInputModal> createState() => _AmountInputModalState();
}

class _AmountInputModalState extends State<AmountInputModal> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  bool _isValidInput(String value) {
    if (value.isEmpty) return true;

    final regex = RegExp(r'^[0-9]*[.]?[0-9]*$');
    if (!regex.hasMatch(value)) return false;

    final dotCount = '.'.allMatches(value).length;
    if (dotCount > 1) return false;

    if (value.contains('.')) {
      final parts = value.split('.');
      if (parts.length != 2) return false;
      if (parts[1].length > 2) return false;
    }

    return true;
  }

  void _onDonePressed() {
    final value = _controller.text;
    if (value.isNotEmpty) {
      final amount = double.tryParse(value);
      Navigator.of(context).pop(amount);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: appColors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 10,
              top: 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: appColors.divider,
                ),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Введите сумму',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appColors.text,
                      ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close,
                    color: appColors.text,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      if (_isValidInput(newValue.text)) {
                        return newValue;
                      } else {
                        return oldValue;
                      }
                    }),
                  ],
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: appColors.text,
                      ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '0.00',
                    hintStyle:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: appColors.text.withValues(alpha: 0.5),
                            ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: appColors.divider,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: appColors.divider,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: appColors.primary,
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onDonePressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Готово',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
