import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({
    Key? key,
    required this.height,
    required this.width,
    required this.navigator,
  }) : super(key: key);

  final double height;
  final double width;
  final GlobalKey<NavigatorState> navigator;

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  List<Map> menu = [
    {'title': 'Activities', 'routeName': '/activities'},
    {'title': 'Hotels', 'routeName': '/hotels'},
    {'title': 'Flights', 'routeName': '/flights'},
    {'title': 'Restaurants', 'routeName': '/restaurants'},

  ];
  int sideBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * 0.2,
      color: const Color(0xFF211955),
      child: Column(
        children: [
          SizedBox(
            height: widget.height * 0.05,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: menu.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RotatedBox(
                  quarterTurns: 3,
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          sideBarIndex = index;
                        });
                        widget.navigator.currentState!.pushNamed(
                            menu[index]['routeName'],
                        );
                      },
                      child: Text(
                        menu[index]['title'],
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                          fontWeight: (index == sideBarIndex)
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: (index == sideBarIndex)
                              ? Colors.white
                              : Colors.white.withAlpha(200),
                          letterSpacing: 2,
                        ),
                      )),
                );
              })
        ],
      ),
    );
  }


}