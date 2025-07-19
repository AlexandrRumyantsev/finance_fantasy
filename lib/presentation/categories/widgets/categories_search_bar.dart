import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_localizations.dart';
import '../../../utils/colors.dart';
import '../logic/cubit.dart';

class CategoriesSearchBar extends StatefulWidget {
  const CategoriesSearchBar({super.key});

  @override
  State<CategoriesSearchBar> createState() => _CategoriesSearchBarState();
}

class _CategoriesSearchBarState extends State<CategoriesSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<CategoriesCubit>().updateSearchQuery(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: appColors.surfaceContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)?.findCategory ??
                    'Найти статью',
                hintStyle: TextStyle(
                  color: appColors.text,
                  fontSize: 16,
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              style: TextStyle(
                color: appColors.text,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              Icons.search,
              color: appColors.text,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
