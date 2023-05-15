import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../utils/mytextstyles.dart';

class HtmlReaderCustomWidget extends StatelessWidget {
  final String htmlFilePath;

  const HtmlReaderCustomWidget({super.key, required this.htmlFilePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(htmlFilePath),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: HtmlWidget(
                snapshot.data!,
                textStyle: MyTextStyles.body1,
                // customStylesBuilder: (element) {
                //   switch (element.localName) {
                //     case 'h2':
                //       return {
                //         'color': MyTextStyles.headline2.color!.value
                //             .toRadixString(16)
                //       };
                //     case 'h3':

                //     case 'p':
                //       return {
                //         'color':
                //             MyTextStyles.body1.color!.value.toRadixString(16)
                //       };
                //     case 'a':
                //       return {
                //         'color':
                //             MyTextStyles.link.color!.value.toRadixString(16)
                //       };
                //     default:
                //       return null;
                //   }
                // },
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
