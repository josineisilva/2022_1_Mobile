import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        //leading: IconButton(
          //icon: const Icon(Icons.menu),
          //onPressed: () {
            //print("Chamar menu da AppBar");
          //},
        //),
        //actions: <Widget>[
          //IconButton(
            //icon: const Icon(Icons.search),
            //onPressed: () {},
          //),
          //IconButton(
            //icon: const Icon(Icons.more_vert),
            //onPressed: () {},
          //),
        //],
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.white70,
          ),
        ),
        bottom: const PopupMenuButtonWidget(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                ContainerWithBoxDecorationWidget(),
                Divider(),
                ColumnWidget(),
                Divider(),
                RowWidget(),
                Divider(),
                ColumnAndRowNestingWidget(),
                Divider(),
                ButtonsWidget(),
                Divider(),
                ButtonBarWidget(),
                Divider(),
                ImagesWidget(),
                Divider(),
                ListViewWidget(),
                Divider(),
                StackWidget(),
                Divider(),
                WrapWidget(),
              ]
            ),
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Tela 1'),
              onTap: () {
                print("Abrir tela 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tela 2'),
              onTap: () {
                print("Abrir tela 2");
                Navigator.pop(context);
              },
            ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Acionando Floating Action");
        },
        child: const Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: const Icon(Icons.pause),
              onTap: () => print("Paused"),
            ),
            const Icon(Icons.stop),
            const Icon(Icons.access_time),
            const Padding(padding: EdgeInsets.all(32.0)),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final Icon icon;
  MenuItem({required this.title, required this.icon});
}

List<MenuItem> MenuList = [
  MenuItem(title: 'Fast Food', icon: const Icon(Icons.fastfood)),
  MenuItem(title: 'Remind Me', icon: const Icon(Icons.add_alarm)),
  MenuItem(title: 'Flight', icon: const Icon(Icons.flight)),
  MenuItem(title: 'Music', icon: const Icon(Icons.audiotrack)),
];

class ContainerWithBoxDecorationWidget extends StatelessWidget {
  const ContainerWithBoxDecorationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(100.0),
              bottomRight: Radius.circular(10.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.lightGreen.shade500,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Center(
            child: RichText(
              text: const TextSpan(
                text: 'Flutter World',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.deepPurpleAccent,
                  decorationStyle: TextDecorationStyle.dotted,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' for',
                  ),
                  TextSpan(
                    text: ' Mobile',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        Text('Column 1'),
        Divider(),
        Text('Column 2'),
        Divider(),
        Text('Column 3'),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: const <Widget>[
        Text('Row 1'),
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Text('Row 2'),
        Padding(
          padding: EdgeInsets.all(16.0),
        ),
        Text('Row 3'),
      ],
    );
  }
}

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text('Célula 1 1'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text('Célula 2 1'),
            Text('Célula 2 2'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text('Célula 3 1'),
            Text('Célula 3 2'),
            Text('Célula 3 3'),
          ],
        ),
      ],
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            FlatButton(
              onPressed: () => print("Flag Texto"),
              child: const Text('Flag'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            FlatButton(
              onPressed: () => print("Flag Icon"),
              child: const Icon(Icons.flag),
              color: Colors.lightGreen,
              textColor: Colors.white,
            ),
          ],
        ),
        const Divider(),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            RaisedButton(
              onPressed: () => print("Save Texto"),
              elevation: 29,
              child: const Text('Save'),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            RaisedButton(
              onPressed: () => print("Save Icon"),
              elevation: 20,
              child: const Icon(Icons.save),
              color: Colors.lightGreen,
            ),
          ],
        ),
      ],
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () => print("Inserir"),
            icon: const Icon(Icons.add), ),
          IconButton(
            onPressed: () => print("Salvar"),
            icon: const Icon(Icons.save), ),
          IconButton(
            onPressed: () => print("Deletar"),
            icon: const Icon(Icons.delete),
            highlightColor: Colors.red, ),
        ],
      ),
    );
  }
}

class PopupMenuButtonWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const PopupMenuButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightGreen.shade100,
      height: preferredSize.height,
      width: double.infinity,
      child: Center(
        child: PopupMenuButton<MenuItem>(
          icon: const Icon(Icons.view_list),
          onSelected: ((valueSelected) {
            print('valueSelected: ${valueSelected.title}');
          }),
          itemBuilder: (BuildContext context) {
            return MenuList.map((MenuItem menuItem) {
              return PopupMenuItem<MenuItem>(
                value: menuItem,
                child: Row(
                  children: <Widget>[
                    Icon(menuItem.icon.icon),
                    const Padding(
                      padding: EdgeInsets.all(8.0), ),
                    Text(menuItem.title),
                  ],
                ),
              );
            }).toList();
          },
        ),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(75.0);
}

class ImagesWidget extends StatelessWidget {
  const ImagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image(
          image: const AssetImage("assets/images/tux.jpg"),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),
        Image.network(
          'https://picsum.photos/250?image=9',
          width: MediaQuery.of(context).size.width / 3,
        ),
      ],
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20.0),
      height: 230.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Image(fit: BoxFit.cover,
            image: AssetImage("assets/images/bmw_m3.jpg"),
          ),
          Image(fit: BoxFit.cover,
            image: AssetImage("assets/images/nissan_gt-r.jpg"), ),
          Image(fit: BoxFit.cover,
            image: AssetImage("assets/images/nissan_sentra.jpg"), ),
        ],
      )
    );
  }
}

class StackWidget extends StatelessWidget {
  const StackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: const <Widget>[
            Image(
              image: AssetImage('assets/images/dawn.jpg'),
            ),
            Positioned(
              top: 0.0,
              right: 0.0,
              child: FractionalTranslation(
                translation: Offset(0.3, -0.3),
                child: CircleAvatar(
                  radius: 24.0,
                  backgroundColor: Colors.white30,
                  child: Icon(
                    Icons.star,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: CircleAvatar(
                radius: 48.0,
                backgroundImage: AssetImage('assets/images/eagle.jpg'),
              ),
            ),
            Positioned(
              bottom: 16.0,
              left: 16.0,
              child: Text(
                'Bald Eagle',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.white30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WrapWidget extends StatelessWidget {
  const WrapWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // gap between adjacent chips
      runSpacing: 4.0, // gap between lines
      children: <Widget>[
        Chip(
          avatar: const Icon(Icons.directions_walk),
          backgroundColor: Colors.yellow[200],
          label: const Text('Walk'),
        ),
        Chip(
          avatar: const Icon(Icons.train),
          backgroundColor: Colors.green[200],
          label: const Text('Train'),
        ),
        Chip(
          avatar: const Icon(Icons.subway),
          backgroundColor: Colors.brown[100],
          label: const Text('Subway'),
        ),
        Chip(
          avatar: const Icon(Icons.directions_bus),
          backgroundColor: Colors.purple[100],
          label: const Text('Bus'),
        ),
        const Chip(
          avatar: Icon(Icons.directions_car),
          backgroundColor: Colors.lightBlueAccent,
          label: Text('Car'),
        ),
        Chip(
          avatar: const Icon(Icons.flight),
          backgroundColor: Colors.red[200],
          label: const Text('Flight'),
        ),
      ],
    );
  }
}