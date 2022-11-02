import 'package:ecs/ui/screens/create_vacation/create_vacation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreateVacationScreen extends StatelessWidget {
  const CreateVacationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CreateVacationViewModel>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFFFFFFF),
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
        ),
        backgroundColor: const Color(0xFFFFFFFF),
        iconTheme: const IconThemeData(
          color: Color(0xFFF98121),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Заповніть будь ласка інформацію',
              style: TextStyle(
                color: Colors.black,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32.0),
            TextFormField(
              controller: model.nameController,
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
                hintText: "Вакансія",
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
              controller: model.companyController,
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
                hintText: 'Компанія',
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
              controller: model.experienceController,
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
                hintText: 'Досвід роботи',
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
              controller: model.experienceController,
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
                hintText: 'Телефонний номер',
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
              controller: model.locationController,
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
                hintText: 'Місто',
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
              controller: model.salaryController,
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
                hintText: 'Прізвище',
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
              controller: model.typeOfEmploymentController,
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
                hintText: 'День народження',
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
              onPressed: () => model.save(context),
              child: const Text(
                'Зберегти',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
