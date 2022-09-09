import 'package:flutter/material.dart';

class VacationListScreen extends StatelessWidget {
  const VacationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFFFFF),
        elevation: 0,
        title: TextField(
          autocorrect: false,
          enableSuggestions: false,
          textCapitalization: TextCapitalization.none,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          cursorRadius: const Radius.circular(4),
          cursorColor: const Color(0xFFF98121),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            hintText: 'What your find?',
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
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.all(0.0)),
            icon: const Icon(
              Icons.filter_list_rounded,
              color: Color.fromRGBO(249, 129, 33, 1),
            ),
          )
        ],
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return const _JobBlockWidget();
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 8.0);
          },
          itemCount: 100),
    );
  }
}

class _JobBlockWidget extends StatelessWidget {
  const _JobBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(10),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(242, 242, 242, 0.36),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'US jobs growth disappoints as recovery falters',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            const _JobBlockTagsListWidget(),
            const SizedBox(height: 4),
            Row(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Nature Channel',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(249, 129, 33, 1),
                        ),
                      ),
                      TextSpan(text: ' '),
                      TextSpan(
                        text: '4 min ago',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(196, 196, 196, 1),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _JobBlockTagsListWidget extends StatelessWidget {
  const _JobBlockTagsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const _JobBlockTagWidget();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 8);
        },
        itemCount: 7,
        padding: const EdgeInsets.all(4.0),
      ),
    );
  }
}

class _JobBlockTagWidget extends StatelessWidget {
  const _JobBlockTagWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 242, 242, 0.48),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        'Flutter',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: Color(0xFF6F7789),
        ),
      ),
    );
  }
}
