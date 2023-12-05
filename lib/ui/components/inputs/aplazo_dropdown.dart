import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoDropDown extends StatelessWidget {
  const AplazoDropDown(
      {super.key,
      required this.optionList,
      required this.dropdownValue,
      required this.label,
      required this.onChange,
      this.paddingVertical = 16});
  final List<DropDownItem> optionList;
  final String dropdownValue;
  final String label;
  final Function onChange;
  final double paddingVertical;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.sizePadding, vertical: paddingVertical),
      child: Column(
        children: [
          AplazoText(
            textProps: TextProps(
                aligment: Alignment.centerLeft,
                text: label,
                paddingHorizontal: 4,
                paddingVertical: 0,
                type: TextType.smallText),
          ),
          const SizedBox(height: 8),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: AppTheme.sizePadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: AppTheme.borderColor,
                width: 1,
              ),
            ),
            child: DropdownButton(
                value: dropdownValue == '' ? null : dropdownValue,
                underline: Container(),
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                hint: AplazoText(
                    textProps: TextProps(
                        aligment: Alignment.centerLeft,
                        text: 'Seleciona una opción',
                        type: TextType.smallText)),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 1,
                borderRadius: BorderRadius.circular(25),
                onChanged: (String? value) {
                  onChange(value);
                },
                items: optionList.map((DropDownItem element) {
                  return DropdownMenuItem(
                    value: element.value,
                    child: AplazoText(
                        textProps: TextProps(
                            text: element.text,
                            type: TextType.text,
                            aligment: Alignment.centerLeft)),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

class DropDownItem {
  final String text;
  final String value;
  DropDownItem({required this.text, required this.value});
}

class DropDownProps {
  String value;
  List<DropDownItem> options;
  DropDownProps({this.value = '', this.options = const []});
}

extension DropDown on List<DropDownItem> {
  List<DropDownItem> uniqueList() {
    List<DropDownItem> uniqueList = [];
    for (var element2 in this) {
      if (uniqueList
          .where((element) => element.value == element2.value)
          .isEmpty) {
        uniqueList.add(element2);
      }
    }
    return uniqueList;
  }
}
