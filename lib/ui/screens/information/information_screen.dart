import 'package:ecs/ui/screens/information/information_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<InformationViewModel>();
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => model.openClientEC(context),
                splashColor: const Color(0xFFF98121).withOpacity(0.06),
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF98121).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Для категорій клієнтів центру зайнятості',
                          style: TextStyle(
                            fontSize: 36.0,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: const [
                            _TagChipWidget(label: 'Для підприємців'),
                            _TagChipWidget(label: 'Для безробітних'),
                            _TagChipWidget(label: 'Для інвалідів'),
                            _TagChipWidget(label: 'Для учасників бойових дій'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => model.openAdditionalInformation(context),
                splashColor: const Color(0xFFF98121).withOpacity(0.06),
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF98121).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Додаткова інформація',
                          style: TextStyle(
                            fontSize: 36.0,
                            height: 1.2,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: const [
                            _TagChipWidget(
                                label: 'Реєстрація в центрі зайнятості'),
                            _TagChipWidget(
                                label: 'Електроннi пошти центру зайнятості'),
                            _TagChipWidget(label: 'Корисні посилання'),
                            _TagChipWidget(label: 'Гарячі лінії'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagChipWidget extends StatelessWidget {
  final String label;

  const _TagChipWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF98121).withOpacity(0.12),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
              color: Color(0xFF000000),
            ),
          ),
        ),
      ],
    );
  }
}
