import 'package:after_layout/after_layout.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/common/util/app_keyboard_util.dart';
import 'package:fast_app_base/common/widget/constant_widget.dart';
import 'package:fast_app_base/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';

import '../../../common/widget/w_rounded_container.dart';

class WriteTodoDialog extends DialogWidget {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> with AfterLayoutMixin{

  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
        body: RoundedContainer(
          color: context.backgroundColor,
          child: Column(
            children: [
              Row(
                children: ["할 일을 작성 해주세요".text.size(18).bold.make(), spacer,
                  _selectedDate.formattedDate.text.make(),
                  IconButton(onPressed: _selectDate, icon: Icon(Icons.calendar_month))
                ],
              ),
              height20,
              Row(
                children: [
                  Expanded(child: TextField(
                    focusNode: node,
                    controller: textController,
                  )),
                  RoundButton(text: '추가', onTap: (){})
                ],
              )
            ],
          ),
        )
    );
  }

  void _selectDate()async{
    final date = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
        initialDate: _selectedDate
    );
    if(date != null){
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
  }
}


