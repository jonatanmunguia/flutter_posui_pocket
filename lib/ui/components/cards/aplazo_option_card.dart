import 'package:flutter/material.dart';
import 'package:flutter_posui_pocket/ui/components/texts/aplazo_text.dart';
import 'package:flutter_posui_pocket/ui/theme/theme_config.dart';

class AplazoOptionCard extends StatefulWidget {
  const AplazoOptionCard(
      {super.key, required this.optionCard, this.richTextProps});

  final OptionCardProps optionCard;
  final RichTextProps? richTextProps;
  @override
  State<AplazoOptionCard> createState() => _AplazoOptionCardState();
}

class _AplazoOptionCardState extends State<AplazoOptionCard> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppTheme.borderColor, //<-- SEE HERE
        ),
        borderRadius: BorderRadius.circular(60.0),
      ),
      child: RadioListTile(
        selectedTileColor: AppTheme.primaryColor,
        activeColor: AppTheme.primaryColor,
        title: AplazoText(
            textProps: TextProps(
                paddingHorizontal: 0,
                paddingVertical: widget.optionCard.padding,
                multiAligment: widget.optionCard.titleAlignment,
                aligment: widget.optionCard.alignText,
                text: widget.optionCard.title,
                type: TextType.headSection)),
        subtitle: widget.richTextProps != null
            ? _getRichText()
            : AplazoText(
                textProps: TextProps(
                    paddingHorizontal: 0,
                    paddingVertical: widget.optionCard.padding,
                    aligment: widget.optionCard.alignText,
                    multiAligment: widget.optionCard.subtitleAlignment,
                    text: widget.optionCard.subtitle,
                    type: TextType.lightText)),
        value: 1,
        groupValue: widget.optionCard.isInteractive
            ? (widget.optionCard.isSelected ? 1 : 0)
            : selected,
        onChanged: (int? value) {
          setState(() {
            if (!widget.optionCard.isInteractive) {
              selected = value ?? 0;
            } else {
              widget.optionCard.onTapSelected(value);
            }
          });
        },
      ),
    );
  }

  Widget _getRichText() {
    const TextStyle normalStyleText =
        TextStyle(color: AppTheme.lightColor, fontFamily: 'Manrope');
    const TextStyle highText = TextStyle(
        color: AppTheme.primaryColor,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w700);
    return RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(children: [
          TextSpan(
              text: widget.richTextProps?.normalText, style: normalStyleText),
          TextSpan(text: widget.richTextProps?.highText, style: highText)
        ]));
  }
}

class RichTextProps {
  final String normalText;
  final String highText;
  const RichTextProps({required this.normalText, required this.highText});
}

class OptionCardProps {
  final String title;
  final String subtitle;
  final Alignment alignText;
  final TextAlign titleAlignment;
  final TextAlign subtitleAlignment;
  final double padding;
  final bool isSelected;
  final bool isInteractive;
  final Function(int? isSelected) onTapSelected;

  const OptionCardProps(
      {required this.title,
      required this.onTapSelected,
      required this.subtitle,
      this.isInteractive = false,
      this.isSelected = false,
      this.padding = 0,
      this.alignText = Alignment.center,
      this.titleAlignment = TextAlign.center,
      this.subtitleAlignment = TextAlign.center});
}
