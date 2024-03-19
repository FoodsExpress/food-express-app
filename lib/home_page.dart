import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(middle: Text('Jeji') ,),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Padding(padding: const EdgeInsets.all(8.0),
      child: SafeArea(child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Jeji에 오신 것을 환영합니다.', style: TextStyle(fontSize: 24.0),),
              const Padding(padding: EdgeInsets.all(8.0)),
              const Text('사진과 동영상을 보려면 팔로우하세요.'),
              const Padding(padding: EdgeInsets.all(16.0),),
              SizedBox(
                width: 260.0,
                child: Card(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.all(8.0)),
                      const SizedBox(
                        width:80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/98408267?v=4'),
                        )
                      ),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      const Text('choyeji1591@gmail.com', style: TextStyle(fontWeight: FontWeight.bold),),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      const Text('조예지'),
                      const Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image(image: AssetImage('assets/001.jpeg'), fit: BoxFit.cover,),
                          ),
                          Padding(padding: EdgeInsets.all(1.0)),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image(image: AssetImage('assets/002.jpeg'), fit: BoxFit.cover),
                          ),
                          Padding(padding: EdgeInsets.all(1.0)),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image(image: AssetImage('assets/003.jpeg'), fit: BoxFit.cover),
                          )
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {  },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent
                        ),
                        child: const Text('팔로우', style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      )),
    );
  }

}
