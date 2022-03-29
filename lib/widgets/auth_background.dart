import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Background(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 40, left: 130, right: 130),
        child: const Image(
            width: 50,
            image: AssetImage('assets/weightlifting.png'),
            fit: BoxFit.scaleDown),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _decorationBackground(),
    );
  }

  BoxDecoration _decorationBackground() => const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(156, 109, 24, 83),
        Color.fromARGB(255, 160, 0, 80),
      ]));
}
