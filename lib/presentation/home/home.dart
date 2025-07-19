import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../di/injection.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/app_localizations.dart';
import '../bank_account/bank_account.dart';
import '../bank_account/logic/cubit.dart';
import '../categories/categories.dart';
import '../categories/logic/cubit.dart';
import '../settings/settings.dart';
import '../summary/logic/expense/cubit.dart';
import '../summary/logic/incomes/cubit.dart';
import '../summary/summary_tab_navigator.dart';

part 'page.dart';
part 'widgets/navigation_bar/navigation_bar.dart';
part 'widgets/navigation_bar/navigation_bar_item.dart';
