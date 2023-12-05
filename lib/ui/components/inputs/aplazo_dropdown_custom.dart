import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/inputs/aplazo_dropdown.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoDropDownCustom extends StatelessWidget {
  const AplazoDropDownCustom(
      {super.key,
      required this.optionList,
      required this.dropdownValue,
      required this.label,
      required this.onChange});
  final List<DropDownItem> optionList;
  final String dropdownValue;
  final String label;
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.sizePadding, vertical: 16),
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
            child: DropdownButtonFormField<String>(
                value: dropdownValue == '' ? null : dropdownValue,
                //underline: Container(),
                hint: AplazoText(
                    textProps: TextProps(
                        aligment: Alignment.centerLeft,
                        text: 'Seleciona una opción',
                        type: TextType.smallText)),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                elevation: 16,
                onChanged: (String? value) {
                  onChange(value);
                },
                items: optionList.map((DropDownItem element) {
                  return DropdownMenuItem(
                    value: element.value,
                    child: Row(
                      children: [
                        Text(element.text),
                      ],
                    ),
                  );
                }).toList()),
          ),
        ],
      ),
    );
  }
}

class _CategorySelect extends StatelessWidget {
  _CategorySelect({required this.options, required this.optionValue});
  final List<DropDownItem> options;
  DropDownItem optionValue =
      DropDownItem(text: 'En progreso', value: "&statusGroup=ACTIVE");
  @override
  Widget build(BuildContext context) {
    return options.isEmpty
        ? Container()
        : DropdownButtonFormField<String>(
            elevation: 1,
            value: optionValue.value,
            borderRadius: BorderRadius.circular(25),
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.only(top: 14, bottom: 14, left: 0, right: 8),
            ),
            items: options
                .map(
                  (category) => DropdownMenuItem<String>(
                    value: category.value,
                    child: Row(
                      children: [
                        Text(category.text),
                      ],
                    ),
                  ),
                )
                .toList(),
            onChanged: (category) {
              if (category == null) return;
            },
          );
  }
}
