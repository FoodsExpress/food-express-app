import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:uuid/uuid.dart';
import 'package:zezi/root_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Instagram Clon',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.all(50)),
            CustomSignInButton(
              text: 'Sign In With Kakao',
              customIcon: Icons.email,
              buttonColor: Colors.yellow,
              mini: false,
              onPressed: () {
                signInWithKakao(context);
              },
            ),
            const Padding(padding: EdgeInsets.all(10)),
            CustomSignInButton(
              text: 'Sign In With Naver',
              customIcon: Icons.email,
              buttonColor: Colors.green,
              mini: false,
              onPressed: () {},
            ),
            const Padding(padding: EdgeInsets.all(10)),
            SignInButton(
              button: Button.Google,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  void signInWithKakao(BuildContext context) async {
    final clientState = Uuid().v4();

    final url = Uri.https('kauth.kakao.com', '/oauth/authorize', {
      'response_type': 'code',
      'client_id': '4722d1df36137f2c11aa0ef701ac58f6',
      'client_secret': 'SeiXyrqnE1MIbGzF7yiWdJefWib9C5Ji',
      'redirect_uri': 'http://localhost:9999/api/oauth2/callback/kakao',
      'state': clientState,
    });

    // Present the dialog to the user
    final result = await FlutterWebAuth2.authenticate(
        url: url.toString(), callbackUrlScheme: "webauthcallback");

    // Extract code from resulting url
    final accessToken = Uri.parse(result).queryParameters['accessToken'];
    print(accessToken);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const RootPage()));
  }
}
