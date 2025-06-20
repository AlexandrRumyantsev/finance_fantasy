import 'package:equatable/equatable.dart';
import 'package:finance_fantasy/domain/entities/transaction_extended.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/status_page.dart';
import '../../_components/logic/base_state.dart';

part 'state.dart';

abstract class BaseSummaryCubit extends Cubit<SummaryState> {
  BaseSummaryCubit()
      : super(
          SummaryState(
            statusPage: StatusPage.loading,
            transactions: [],
          ),
        ) {
    loadData();
  }

  Future<void> loadData();
}
