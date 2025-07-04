import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/account_brief.dart';
import '../../../utils/colors.dart';
import '../../bank_account/logic/cubit.dart';
import '../components.dart';

class SelectBankAccount extends StatefulWidget {
  const SelectBankAccount({
    super.key,
    this.onAccountSelected,
  });

  final void Function(AccountBrief account)? onAccountSelected;

  @override
  State<SelectBankAccount> createState() => _SelectBankAccountState();
}

class _SelectBankAccountState extends State<SelectBankAccount> {
  @override
  void initState() {
    super.initState();
    context.read<BankAccountCubit>().loadData();
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
                  'Выберите счет',
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
          BlocBuilder<BankAccountCubit, BankAccountState>(
            builder: (context, state) {
              if (state.bankAccounts.isEmpty) {
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: Text(
                      'Нет доступных счетов',
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 8),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final account = state.bankAccounts[index];
                  return _BankAccountSelectionItem(
                    account: account,
                    onTap: () {
                      widget.onAccountSelected?.call(account);
                      Navigator.of(context).pop();
                    },
                  );
                },
                separatorBuilder: (context, index) => CustomDivider(
                  color: appColors.divider,
                ),
                itemCount: state.bankAccounts.length,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _BankAccountSelectionItem extends StatelessWidget {
  const _BankAccountSelectionItem({
    required this.account,
    required this.onTap,
  });

  final AccountBrief account;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).extension<AppColors>()!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: appColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.account_balance,
                color: appColors.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),

            // Информация о счете
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    account.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${account.balance} ${account.currency}',
                    style: TextStyle(
                      fontSize: 14,
                      color: appColors.text.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),

            // Иконка стрелки
            Icon(
              Icons.chevron_right,
              color: appColors.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
