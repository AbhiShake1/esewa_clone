part of 'home_page.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            color: context.theme.appBarTheme.color,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(50)),
          ),
          child: Row(
            children: const [
              PointsBar(
                icon: Icons.account_balance_wallet_outlined,
                currency: 'NPR',
                points: 5000.17,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                ),
              ),
              PointsBar(
                icon: Icons.wine_bar,
                iconPosition: IconPosition.trailing,
                points: 7.15,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
