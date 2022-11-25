import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/main.dart';
import 'package:shopping_cart/provider/login_provider.dart';
import 'package:shopping_cart/registerScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 189, 108, 121),
                  Color.fromARGB(255, 145, 95, 80),
                  Color.fromARGB(255, 117, 65, 66),
                  Color.fromARGB(255, 52, 30, 54),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  _buildEmailTF(emailController),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _buildPasswordTF(passwordController),
                  _buildForgotPasswordBtn(),
                  _buildRememberMeCheckbox(),
                  _buildLoginBtn(context, emailController, passwordController),
                  _buildSignInWithText(),
                  _buildSocialBtnRow(),
                  _buildSignupBtn(context),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}

Widget _buildEmailTF(TextEditingController emailController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Email',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextField(
          key: const Key('email'),
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black87,
            ),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildPasswordTF(TextEditingController passwordController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Password',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
      const SizedBox(height: 10.0),
      Container(
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 60.0,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          style: const TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black87,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black38,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _buildForgotPasswordBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(right: 0.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () => print('Forgot Password Button Pressed'),
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    ),
  );
}

Widget _buildRememberMeCheckbox() {
  return SizedBox(
    height: 20.0,
    child: Row(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: true,
            checkColor: Colors.green,
            activeColor: Colors.white,
            onChanged: (value) {},
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    ),
  );
}

Widget _buildLoginBtn(BuildContext context, TextEditingController email,
    TextEditingController password) {
  final loginProvider = Provider.of<LoginProvider>(context);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5.0,
        padding: const EdgeInsets.all(15.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        primary: Colors.white,
      ),
      onPressed: () async => {
        await loginProvider.login(
            email.text.toString(), password.text.toString()),
        if (loginProvider.isLogin)
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()))
          }
        else
          {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Error'),
                content: const Text('Login failed'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            ),
          }
      },
      child: const Text(
        'LOGIN',
        style: TextStyle(
          color: Color(0xFF527DAA),
          letterSpacing: 1.5,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ),
  );
}

Widget _buildSignInWithText() {
  return Column(
    children: const <Widget>[
      Text(
        '- OR -',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
      SizedBox(height: 20.0),
      Text(
        'Sign in with',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'OpenSans',
        ),
      ),
    ],
  );
}

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(
          image: logo,
        ),
      ),
    ),
  );
}

Widget _buildSocialBtnRow() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildSocialBtn(
          () => print('Login with Facebook'),
          const AssetImage(
            'assets/logos/facebook.jpg',
          ),
        ),
        _buildSocialBtn(
          () => print('Login with Google'),
          const AssetImage(
            'assets/logos/google.jpg',
          ),
        ),
      ],
    ),
  );
}

Widget _buildSignupBtn(BuildContext context) {
  return GestureDetector(
    onTap: () => {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const RegisterScreen()))
    },
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
