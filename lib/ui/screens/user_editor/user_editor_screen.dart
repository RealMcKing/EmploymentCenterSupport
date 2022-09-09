import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserEditorScreen extends StatelessWidget {
  const UserEditorScreen({Key? key}) : super(key: key);

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
              'What do you want to change?',
              style: TextStyle(
                color: Colors.black,
                fontSize: 64,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Name',
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
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Surname',
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
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Phone Number',
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
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'City',
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
            TextFormField(
              autocorrect: false,
              enableSuggestions: false,
              textCapitalization: TextCapitalization.none,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
              cursorRadius: const Radius.circular(4),
              cursorColor: const Color(0xFFF98121),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                hintText: 'Birthday',
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
            ElevatedButton(
              onPressed: () {},
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
                'Save',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
