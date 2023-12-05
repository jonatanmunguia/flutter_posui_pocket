import 'package:flutter/material.dart';

class AplazoActionSheet extends StatelessWidget {
  const AplazoActionSheet({super.key, required this.contentList});

  //final ActionSheetProps actionSheet;
  final List<Widget> contentList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: contentList),
        ),
      ),
    ));
  }
}

class ActionSheetProps {
  final String title;
  final String subtitle;
  final String buttonTitle;

  const ActionSheetProps(
      {required this.title, required this.buttonTitle, required this.subtitle});
}

showAplazoActionSheet(
    {required BuildContext context,
    required List<Widget> contentList,
    bool isScrollControlled = false}) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      builder: (BuildContext context) {
        return AplazoActionSheet(
          contentList: contentList,
        );
      },
      isScrollControlled: isScrollControlled);
}

showAplazoDynamicActionSheet(
    {required BuildContext context, required Widget widget}) {
  showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: StatefulBuilder(builder: (BuildContext context, setState) {
            return SingleChildScrollView(
                child: SizedBox(
                    child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              child: widget,
            )));
          }),
        );
      });
}
