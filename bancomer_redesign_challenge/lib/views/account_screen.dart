import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:bancomer_redesign_challenge/widgets/background.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Background(
          color: BBVAColors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.arrow_back,
                size: 30.0,
                color: BBVAColors.primary,
              ),
              Text(
                'Cuenta *37265',
                style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.bold, fontSize: 22),
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
        Positioned(
          left: 5.0,
          right: 5.0,
          top: size.height * 0.15,
          height: size.height * 0.35,
          child: Card(
            color: BBVAColors.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/bbva.png',
                        color: BBVAColors.white,
                        width: size.width * 0.25,
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: BBVAColors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        '\$20,000.00',
                        style: TextStyle(color: BBVAColors.white, fontSize: 40.0),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Saldo disponible',
                        style: TextStyle(color: BBVAColors.white, fontSize: 12.0),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '001ah7297',
                        style: TextStyle(color: BBVAColors.white, fontSize: 16.0),
                      ),
                      Image.asset(
                        'assets/visa.png',
                        color: BBVAColors.white,
                        width: size.width * 0.15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(left: 0.0, right: 0.0, top: size.height * 0.52, height: size.height * 0.25, child: _ActionList()),
        Positioned.fill(
            child: DraggableScrollableSheet(
          minChildSize: 0.2,
          maxChildSize: 0.48,
          initialChildSize: 0.2,
          expand: false,
          builder: (context, scrollController) {
            return Material(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              color: BBVAColors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ÚLTIMOS MOVIMIENTOS',
                            style: TextStyle(color: BBVAColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.search,
                            color: BBVAColors.primaryLight,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: 10,
                        controller: scrollController,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (index % 3 == 1)
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    '2 enero',
                                    style: TextStyle(color: BBVAColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0), border: Border.all(width: 0.5, color: BBVAColors.primaryLight)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Su pago en efectivo',
                                            style: TextStyle(color: BBVAColors.primary, fontSize: 16, fontWeight: FontWeight.w400),
                                          ),
                                          Text(
                                            '\$ 1,600.00',
                                            style: TextStyle(color: BBVAColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Transferencia interbancaria', style: TextStyle(color: BBVAColors.primaryLight, fontSize: 13)),
                                          Text('Hoy', style: TextStyle(color: BBVAColors.primaryLight, fontSize: 13)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )),
      ],
    ));
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
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.credit_card,
                      color: BBVAColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Detalle de tarjeta',
                      style: TextStyle(color: BBVAColors.primary, fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Apagar tarjeta',
                      style: TextStyle(color: BBVAColors.primary, fontSize: 13, fontWeight: FontWeight.w300),
                    ),
                    Switch(
                      value: false,
                      onChanged: (value) {},
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
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
          ),
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
