import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tabbed_card/tabbed_card.dart';

void main() {
  runApp(const CardFin());
}

class CardFin extends StatelessWidget {
  const CardFin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Senastion',
      scrollBehavior: ScrollConfiguration.of(context)
          .copyWith(scrollbars: false, dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      }),
      home: const Card(title: 'Senastion'),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key, required this.title});

  final String title;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: TabbedCard(
          tabs: [
            TabbedCardItem(
              label: "Bajo Rendimiento",
              child: const Placeholder(),
            ),
            TabbedCardItem(
              label: "Deserción",
              child: const Placeholder(),
            ),
            TabbedCardItem(
              label: "Felicitaciones",
              child: const Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
