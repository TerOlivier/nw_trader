import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:nw_trader/constants/asset_path.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DrawerHeader(
                      child: SvgPicture.asset(
                    nwLogoIconPath,
                    color: Colors.white,
                  )),
                  DrawerListTile(
                    title: "Dashboard",
                    svgSrc: dashboardIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Transactions",
                    svgSrc: transactionsIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Buy Orders",
                    svgSrc: documentsIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Sell Orders",
                    svgSrc: documentsIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Notifications",
                    svgSrc: notificationIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Profile",
                    svgSrc: profileIconPath,
                    press: () {},
                  ),
                  DrawerListTile(
                    title: "Settings",
                    svgSrc: settingsIconPath,
                    press: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
