import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:bancomer_redesign_challenge/views/account_screen.dart';
import 'package:bancomer_redesign_challenge/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Background(
          color: BBVAColors.primary,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu,
                size: 30.0,
                color: BBVAColors.white,
              ),
              Text(
                'Hola, Christopher',
                style: TextStyle(color: BBVAColors.white, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: BBVAColors.white),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              height: size.height * 1.35,
              child: Stack(
                children: [
                  Positioned(
                    left: 5.0,
                    right: 5.0,
                    top: size.height * 0.15,
                    height: size.height * 0.35,
                    child: _MyAccounts(),
                  ),
                  Positioned(left: 0.0, right: 0.0, top: size.height * 0.52, height: size.height * 0.18, child: _ActionList()),
                  Positioned(
                    left: 0.0,
                    right: 0.0,
                    top: size.height * 0.72,
                    height: size.height * 0.5,
                    child: _MyCards(),
                  ),
                ],
              ),
            )),
        Positioned(left: 0.0, right: 0.0, bottom: 0.0, height: kToolbarHeight, child: _BottomNavBar())
      ],
    ));
  }
}

class _MyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: BBVAColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'TUS TARJETAS',
              textAlign: TextAlign.start,
              style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            // const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(index == 0 ? 15.0 : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: vector.radians(index == 0 ? 0 : 270),
                          child: Container(
                            height: size.height * 0.25,
                            width: size.width * 0.65,
                            decoration: BoxDecoration(color: BBVAColors.primary, borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/bbva.png',
                                      color: BBVAColors.white,
                                      width: size.width * 0.2,
                                    ),
                                    Image.asset(
                                      'assets/chip.png',
                                      width: size.width * 0.1,
                                    ),
                                    Text(
                                      '*62396',
                                      style: TextStyle(color: BBVAColors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                                  child: Image.asset(
                                    'assets/visa.png',
                                    color: BBVAColors.white,
                                    width: size.width * 0.15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (index == 0)
                          Expanded(
                            child: Container(
                              width: size.width * 0.65,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 18.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.credit_card,
                                          size: 20,
                                          color: BBVAColors.primary,
                                        ),
                                        Text(
                                          'Tarjeta digital',
                                          style: TextStyle(fontWeight: FontWeight.w300, color: BBVAColors.primary, fontSize: 13),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Desactivar',
                                          style: TextStyle(fontWeight: FontWeight.w300, color: BBVAColors.primary, fontSize: 13),
                                        ),
                                        Switch(
                                          value: false,
                                          onChanged: (value) {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: BBVAColors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home_filled,
                color: BBVAColors.primary,
              ),
              Container(
                height: 5.0,
                width: 5.0,
                decoration: BoxDecoration(color: BBVAColors.primary, shape: BoxShape.circle),
              )
            ],
          )),
          Expanded(
              child: Icon(
            Icons.favorite_border,
            color: BBVAColors.primaryLight,
          )),
          Expanded(
              child: Icon(
            Icons.add_circle_outline,
            color: BBVAColors.primaryLight,
          )),
          Expanded(
              child: Icon(
            Icons.mail_outline,
            color: BBVAColors.primaryLight,
          )),
        ],
      ),
    );
  }
}

class _ActionList extends StatelessWidget {
  final List<_ActionListItem> actions = [
    _ActionListItem(color: Color(0xFFF7893A), icon: Icons.add, text: 'Oportunidades'),
    _ActionListItem(color: Color(0xFF4CABCE), icon: Icons.swap_horiz, text: 'Transferir'),
    _ActionListItem(color: Color(0xFF49D17C), icon: Icons.attach_money, text: 'Retiro sin tarjeta'),
    _ActionListItem(color: Color(0xFF735FDA), icon: Icons.build, text: 'Pagar servicio'),
    _ActionListItem(color: Color(0xFFDA5F84), icon: Icons.call, text: 'Recargas'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: BBVAColors.white,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: actions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final item = actions[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  padding: const EdgeInsets.all(10.0),
                  fillColor: item.color,
                  shape: CircleBorder(),
                  child: Icon(
                    item.icon,
                    color: BBVAColors.white,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 5),
                Text(
                  item.text,
                  style: TextStyle(color: BBVAColors.primaryLight, fontSize: 15),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MyAccounts extends StatelessWidget {
  const _MyAccounts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TUS CUENTAS',
                  style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Icon(
                  Icons.more_horiz,
                  color: BBVAColors.primaryLight,
                  size: 35,
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountScreen()));
              },
              child: _AccountItem(
                account: '001ah7297',
                number: '*37265',
                amount: '\$20,000',
              ),
            ),
            Divider(
              color: BBVAColors.grey,
              thickness: 1.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => AccountScreen()));
              },
              child: _AccountItem(
                account: '001ah7246',
                number: '*36264',
                amount: '\$158,000',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountItem extends StatelessWidget {
  final String account;
  final String number;
  final String amount;

  const _AccountItem({Key key, @required this.account, @required this.number, @required this.amount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account,
                  style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.w300, fontSize: 18),
                ),
                Text(
                  number,
                  style: TextStyle(color: BBVAColors.primaryLight, fontWeight: FontWeight.w300, fontSize: 16),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.w400, fontSize: 22),
          ),
          const SizedBox(width: 20),
          Icon(
            Icons.chevron_right,
            color: BBVAColors.primary,
          )
        ],
      ),
    );
  }
}

class _ActionListItem {
  final String text;
  final Color color;
  final IconData icon;
  _ActionListItem({@required this.text, @required this.color, @required this.icon});
}
