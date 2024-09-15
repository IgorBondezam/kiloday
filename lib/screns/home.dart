import 'package:flutter/material.dart';
import 'package:kiloday/components/expanded_listagem_title_subtitle.dart';
import 'package:kiloday/model/alimento.dart';
import 'package:kiloday/model/user.dart';
import 'package:kiloday/screns/crud_alimento.dart';
import 'package:kiloday/screns/crud_refeicao.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.user});

  User user;

  @override
  State<Home> createState() => _HomeState();

  List<Alimento> alimentos = [];
}

class _HomeState extends State<Home> {
  List<String> steps = ['Home', 'Refeições', 'Alimentos'];

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      Card(
        child: widget.user.refeicoes.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nenhuma refeição cadastrada.',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExpandedListagemTitleSubtitle(
                    listagem: widget.user.refeicoes,
                  ),
                ],
              ),
      ),
      CrudRefeicao(widget.alimentos, widget.user.refeicoes),
      CrudAlimento(widget.alimentos),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(steps[_selectedIndex]),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(
        child: widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Refeições'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Alimentos'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
