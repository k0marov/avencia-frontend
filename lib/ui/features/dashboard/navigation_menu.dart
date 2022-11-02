import 'package:avencia/ui/core/app/logo_widget.dart';
import 'package:avencia/ui/features/dashboard/simple_button.dart';
import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(children: [
                SizedBox(
                    child: LogoWidget(
                  width: 150,
                )),
                Spacer(),
                SizedBox(
                  height: 35,
                  width: 35,
                  child: SimpleButton(
                    iconSize: 20,
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icons.close,
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
