import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:zezi/create_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.add_event,
      animatedIconTheme: const IconThemeData(size: 28.0),
      backgroundColor: Colors.green[900],
      visible: true,
      curve: Curves.bounceInOut,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.photo_album, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const CreatePage())),
          label: '앨범',
          labelStyle:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_a_photo, color: Colors.white),
          backgroundColor: Colors.green,
          onTap: () => print('Pressed Code'),
          label: '카메라',
          labelStyle:
          const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          labelBackgroundColor: Colors.black,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const CreatePage()));
        },
        child: const Icon(Icons.create),
      ),*/
      floatingActionButton: buildSpeedDial(),
    );
  }

  _buildBody() {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1
    ),
        itemCount: 5,
        itemBuilder: (context, index){
      return _buildListItem(context, index);
    });
  }

  _buildListItem(BuildContext context, int index) {
    return Image.network("https://avatars.githubusercontent.com/u/98408267?v=4", fit: BoxFit.cover);
  }
}