import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:uuid/uuid.dart';
import 'package:zezi/common/const/colors.dart';
import 'package:zezi/common/layout/default_layout.dart';
import 'package:zezi/home/view/home_screen.dart';
import 'package:zezi/user/provider/user_me_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static String get routeName => 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userMeProvider);

    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _Title(),
                const SizedBox(height: 16.0),
                const _SubTitle(),
                Image.asset(
                  'asset/img/logo/zezi-logo.png',
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  child: CustomSignInButton(
                    text: 'Sign In With Kakao',
                    customIcon: Icons.email,
                    buttonColor: Colors.yellow,
                    mini: false,
                    onPressed: () {
                      signInWithKakao(context);
                    },
                  )
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  child: CustomSignInButton(
                    text: 'Sign In With Naver',
                    buttonColor: Colors.green,
                    mini: false,
                    onPressed: () {},
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  child: CustomSignInButton(
                    customIcon: FontAwesomeIcons.google,

                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

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
      context, MaterialPageRoute(builder: (context) => const HomeScreen()));
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'ZeZi!',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '여행의 모든 순간을 담아 보세요 !\nZezi가 여러분과 함께 합니다.',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
