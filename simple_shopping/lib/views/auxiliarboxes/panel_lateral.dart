import "package:flutter/material.dart";

class PanelLateral extends StatelessWidget {
  const PanelLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(children: [
        AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[200],
          title: const Text('Opciones'),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 24),
        ),
        const _Tiles(name: 'Mis Pedidos'),
        const _Tiles(name: 'Perfil'),
        const _Tiles(name: 'Categorias'),
      ]),
    );
  }
}

class _Tiles extends StatelessWidget {
  final String name;

  const _Tiles({required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(color: Colors.grey[400]),
          margin: const EdgeInsets.only(top: 4),
          child: Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24),
            ),
          )),
      onTap: (){
        print('Pulsado $name');
      },
    );
  }
}
