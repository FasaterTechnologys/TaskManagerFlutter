import 'package:flutter/material.dart';

import 'taskinputbottomsheet.dart';

void customshowmodalbottomsheet(BuildContext context, Function refreshData,
    {int? index, String? title, String? description, String? category}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) => TaskInputBottomSheet(
      updateData: refreshData,
      index: index,
      category: category,
    ),
  );
}
