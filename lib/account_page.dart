import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return CupertinoNavigationBar(
      leading: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(Icons.exit_to_app),
          ],
        ),
      ),
    );
  }

  _buildBody() {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/98408267?v=4'),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        alignment: Alignment.center,
                        children: const [
                          SizedBox(
                            width: 28,
                            height: 28,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.white,
                            )
                          ),
                          SizedBox(
                            width: 25,
                            height: 25,
                            child: FloatingActionButton(
                              onPressed: null,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add),),
                          ),
                        ],
                      )
                    )
                  ],
                ),
                const Text('조예지', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
              ],
            ),
            const Text('0\n게시물', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
            const Text('0\n팔로워', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
            const Text('0\n팔로잉', textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          ],
        ),
    );
  }

}
