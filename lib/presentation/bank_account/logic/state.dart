part of 'cubit.dart';

enum PageMode {
  list,
  edit,
}

class BankAccountState extends Equatable {
  const BankAccountState({
    this.bankAccounts = const [],
    this.status = StatusPage.loading,
    this.pageMode = PageMode.list,
  });

  final List<AccountBrief> bankAccounts;
  final PageMode pageMode;
  final StatusPage status;

  BankAccountState copyWith({
    List<AccountBrief>? bankAccounts,
    StatusPage? status,
    PageMode? pageMode,
  }) {
    return BankAccountState(
      bankAccounts: bankAccounts ?? this.bankAccounts,
      status: status ?? this.status,
      pageMode: pageMode ?? this.pageMode,
    );
  }

  @override
  List<Object?> get props => [
        bankAccounts,
        status,
        pageMode,
      ];
}
