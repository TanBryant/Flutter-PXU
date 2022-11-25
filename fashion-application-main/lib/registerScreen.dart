import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF61A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
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
                  vertical: 50.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    _buildNameTF(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _buildEmailTF(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _buildPasswordTF(),
                    const SizedBox(
                      height: 30.0,
                    ),
                    _buildConfirmPasswordTF(),
                    _buildRegisterBtn(),
                    _buildLoginBtn(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}

Widget _buildNameTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Name',
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
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.black,
            ),
            hintText: 'Enter your Name',
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

Widget _buildEmailTF() {
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
        child: const TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: Colors.black,
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

Widget _buildPasswordTF() {
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
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
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

Widget _buildConfirmPasswordTF() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Text(
        'Confirm Password',
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
        child: const TextField(
          obscureText: true,
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'OpenSans',
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.black,
            ),
            hintText: 'Confirm your Password',
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

Widget _buildRegisterBtn() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 25.0),
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () => print('Register Button Pressed'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        primary: Colors.white,
      ),
      child: const Text(
        'REGISTER',
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

Widget _buildLoginBtn() {
  return GestureDetector(
    onTap: () => print('Login Button Pressed'),
    child: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Already have an Account? ',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'Login',
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
