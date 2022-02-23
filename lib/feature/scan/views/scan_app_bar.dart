part of 'scan_page.dart';

class ScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScanAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: 'Scan QR Code to Pay'.text.xl2.make(),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.cancel))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
