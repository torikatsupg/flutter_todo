import 'package:intl/intl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateFormatProvider =
    Provider<DateFormat>((_) => DateFormat('yyyy-MM-dd HH:mm'));
