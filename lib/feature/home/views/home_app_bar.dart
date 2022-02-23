part of 'home_page.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      leading: Row(
        children: [
          16.widthBox,
          const CircleAvatar(
            child: Icon(Icons.percent),
          ).scale(scaleValue: 1.6)
        ],
      ),
      actions: const [
        Icon(Icons.search_rounded),
        Icon(Icons.notifications_none_rounded),
        Icon(Icons.menu)
      ].map((e) => e.px(10)).toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
