import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 64,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Enter Your Email & Password',
              style: TextStyle(
                color: Colors.black.withOpacity(0.75),
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 32.0),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(111, 119, 137, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                filled: true,
                isDense: false,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color.fromRGBO(111, 119, 137, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
                filled: true,
                isDense: false,
                suffixIcon: IconButton(
                  iconSize: 20.0,
                  onPressed: () {},
                  splashRadius: 18.0,
                  icon: const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color.fromRGBO(111, 119, 137, 1),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                fillColor: const Color.fromRGBO(242, 242, 242, 0.48),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(
                      color: Color(0xFFC72C41),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Oh, I'm sorry",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Some unexpected error occurred, possibly later',
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              style: ElevatedButton.styleFrom(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                backgroundColor: Colors.black,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 84,
                  vertical: 9,
                ),
              ),
              child: const Text(
                'Sign In',
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.11)
          ],
        ),
      ),
    );
  }
}
