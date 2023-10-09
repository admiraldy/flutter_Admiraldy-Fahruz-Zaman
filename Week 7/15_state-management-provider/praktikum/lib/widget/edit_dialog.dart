import 'package:flutter/material.dart';
import 'package:praktikum/model/contacts.dart';
import 'package:praktikum/widget/textfield.dart';
import 'package:provider/provider.dart';

class EditDialog extends StatefulWidget {
  final Contacts contact;

  const EditDialog({super.key, required this.contact});

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  final TextEditingController editedName = TextEditingController();
  final TextEditingController editedNumber = TextEditingController();

  @override
  void initState(){
    super.initState();
    editedName.text = widget.contact.name;
    editedNumber.text = widget.contact.number;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFieldWidget(
            textController: editedName,
            textLabel: 'Name',
            textHint: 'Name',
          ),
          TextFieldWidget(
            textController: editedNumber,
            textLabel: 'Number',
            textHint: '+62',
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: (){
            widget.contact.name = editedName.text;
            widget.contact.name = editedNumber.text;

            final contactsModel = Provider.of(context, listen: false);
            contactsModel.notifyListener();

            Navigator.of(context).pop();
          },
          child: const Text('Save'),
        )
      ],
    );
  }
}