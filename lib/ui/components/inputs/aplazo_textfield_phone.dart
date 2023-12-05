import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_textfield.dart';

class AplazoTextFieldPhone extends StatelessWidget {
  const AplazoTextFieldPhone(
      {Key? key, required this.controller, required this.onChanged})
      : super(key: key);

  final TextEditingController controller;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return AplazoTextField(
      controller: controller,
      textFieldProps: TextFieldProps(
          mask: '',
          maxLenght: 10,
          label: 'Número celular',
          textFieldType: TextFieldType.phone,
          hintText: '00 0000 0000'),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
