import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        _Background(),
        Positioned(
          left: 10.0,
          right: 10.0,
          top: size.height * 0.15,
          height: size.height * 0.35,
          child: _MyAccounts(),
        ),
      ],
    ));
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
            _AccountItem(
              account: '001ah7297',
              number: '*37265',
              amount: '\$20,000',
            ),
            Divider(
              color: BBVAColors.grey,
              thickness: 1.0,
            ),
            _AccountItem(
              account: '001ah7246',
              number: '*36264',
              amount: '\$158,000',
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

class _Background extends StatelessWidget {
  const _Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: BBVAColors.primary,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
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
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: BBVAColors.secondary,
          ),
        ),
      ],
    );
  }
}
