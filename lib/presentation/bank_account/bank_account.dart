import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/account_brief.dart';
import '../../domain/entities/status_page.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../components/components.dart';
import '../components/paints/icons/check.dart';
import '../components/paints/icons/chevron_right.dart';
import '../components/paints/icons/cross.dart';
import 'logic/cubit.dart';
import 'widgets/balance_chart.dart';

part 'page.dart';
part 'widgets/bank_account_list.dart';
part 'widgets/bank_account_edit_item.dart';
part 'widgets/bank_acount_list_item.dart';
part 'widgets/bank_account_list_edit.dart';
