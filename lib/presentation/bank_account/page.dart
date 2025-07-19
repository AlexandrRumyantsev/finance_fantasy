part of 'bank_account.dart';

class BankAccountPage extends StatefulWidget {
  const BankAccountPage({super.key});

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage> {
  @override
  void initState() {
    super.initState();
    context.read<BankAccountCubit>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BankAccountCubit>();
    final appColors = Theme.of(context).extension<AppColors>()!;
    return BlocBuilder<BankAccountCubit, BankAccountState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              cubit.loadData();
            },
            color: appColors.primary,
            child: CustomScrollView(
              slivers: [
                CommonFinanceAppBar(
                  title: state.bankAccounts.firstOrNull?.name ??
                      (AppLocalizations.of(context)?.myAccount ?? 'Мой счет'),
                  suffix: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: state.pageMode == PageMode.edit
                        ? CheckIcon(
                            key: const ValueKey('check'),
                            color: appColors.text,
                          )
                        : SvgPicture.asset(
                            key: const ValueKey('edit'),
                            AppIcons.edit,
                            width: 40,
                            height: 40,
                          ),
                  ),
                  onSuffixPressed: cubit.toggleEditMode,
                  prefix: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: state.pageMode == PageMode.edit
                        ? CrossIcon(
                            key: const ValueKey('cross'),
                            color: appColors.text,
                          )
                        : const SizedBox.shrink(key: ValueKey('empty')),
                  ),
                  onPrefixPressed: cubit.toggleEditMode,
                ),
                switch (state.pageMode) {
                  PageMode.list => BankAccountList(
                      bankAccounts: state.bankAccounts,
                      status: state.status,
                    ),
                  PageMode.edit => BankAccountListEdit(
                      bankAccounts: state.bankAccounts,
                      status: state.status,
                    ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
