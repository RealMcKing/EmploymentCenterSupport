import 'package:ecs/ui/screens/resume_editor/resume_editor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ResumeEditorScreen extends StatelessWidget {
  const ResumeEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ResumeEditorViewModel>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            centerTitle: true,
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
            title: const Text(
              'Resume Editor',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF000000),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            width: 104,
                            height: 104,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF98121).withOpacity(0.12),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: model.vacancyController,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  textCapitalization:
                                  TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.text,
                                  cursorRadius: const Radius.circular(4),
                                  cursorColor: const Color(0xFFF98121),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'Vacancy',
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
                                    fillColor: const Color.fromRGBO(
                                        242, 242, 242, 0.48),
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
                                const SizedBox(height: 8),
                                TextField(
                                  controller: model.universityController,
                                  autocorrect: false,
                                  enableSuggestions: false,
                                  textCapitalization: TextCapitalization.sentences,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  cursorRadius: const Radius.circular(4),
                                  cursorColor: const Color(0xFFF98121),
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'University',
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
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: model.specialtyController,
                        autocorrect: false,
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorRadius: const Radius.circular(4),
                        cursorColor: const Color(0xFFF98121),
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Specialty',
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: model.specialtyDateStartController,
                              autocorrect: false,
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorRadius: const Radius.circular(4),
                              cursorColor: const Color(0xFFF98121),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Date start',
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
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: model.specialtyDateEndController,
                              autocorrect: false,
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorRadius: const Radius.circular(4),
                              cursorColor: const Color(0xFFF98121),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Date end',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: model.lastJobController,
                        autocorrect: false,
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorRadius: const Radius.circular(4),
                        cursorColor: const Color(0xFFF98121),
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Last job',
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
                      const SizedBox(height: 8),
                      TextField(
                        controller: model.positionController,
                        autocorrect: false,
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        cursorRadius: const Radius.circular(4),
                        cursorColor: const Color(0xFFF98121),
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Position',
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
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: model.jobDateStartController,
                              autocorrect: false,
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorRadius: const Radius.circular(4),
                              cursorColor: const Color(0xFFF98121),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Date start',
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
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: model.jobDateEndController,
                              autocorrect: false,
                              enableSuggestions: false,
                              textCapitalization: TextCapitalization.sentences,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              cursorRadius: const Radius.circular(4),
                              cursorColor: const Color(0xFFF98121),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Date end',
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
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: model.aboutMeController,
                        autocorrect: false,
                        enableSuggestions: false,
                        textCapitalization: TextCapitalization.none,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.visiblePassword,
                        cursorRadius: const Radius.circular(4),
                        cursorColor: const Color(0xFFF98121),
                        minLines: 20,
                        maxLines: 20,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                        decoration: InputDecoration(
                          hintText: 'About Me',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => model.save(context),
        label: Column(
          children: const [
            Text(
              'Save',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
              ),
            ),
            Text(
              'And exit',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w300,
                fontSize: 11.0,
              ),
            ),
          ],
        ),
        icon: const Icon(
          Icons.save_rounded,
          size: 18.0,
          color: Color(0xFFFFFFFF),
        ),
        backgroundColor: const Color(0xFF000000),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(13.0),
          ),
        ),
      ),
    );
  }
}
