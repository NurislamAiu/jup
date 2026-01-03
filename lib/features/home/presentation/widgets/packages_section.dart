import 'package:flutter/material.dart';

class PackagesSection extends StatelessWidget {
  const PackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 12),
          child: Text(
            'Готовые Пакеты',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF3D3632), letterSpacing: 0.2),
          ),
        ),
        SizedBox(
          height: 210, // Увеличена высота для более просторных карточек
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(width: 8),
              _PackageCard(
                title: 'JUP SIGNATURE (Флагман)',
                description: 'Мы всё решим за вас. Полностью секретный ивент: формат, место, сценарий, бронирование и оплата. Это ядро JUP.',
                startColor: const Color(0xFFD4A373),
                endColor: const Color(0xFFB88E6D),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP ROMANCE',
                description: 'Для близости, тепла и внимания. Романтический сценарий, спокойный темп. Идеально для годовщин и примирений.',
                startColor: const Color(0xFFE5BDB2),
                endColor: const Color(0xFFDCC8C2),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP HOME (JUP IN)',
                description: 'Когда хочется остаться дома, но не потерять момент. Домашний сценарий, коробка с заданиями и никакой суеты.',
                startColor: const Color(0xFFF5F1EE),
                endColor: const Color(0xFFEAE2DD),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP FUN',
                description: 'Лёгкость, смех и эмоции. Активный формат с играми и неожиданными заданиями. Идеально, когда хочется встряхнуться.',
                startColor: const Color(0xFFD7E0E3),
                endColor: const Color(0xFFC5D3D6),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP CARE MOMENT',
                description: 'Забота без повода: цветы, записка, маленький сюрприз. Часто предлагается AI-психологом между ивентами.',
                startColor: const Color(0xFFF0E4E4),
                endColor: const Color(0xFFF5EDEC),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP ADVENT',
                description: 'Подготовка важнее одного дня. Серия дней с заданиями и посланиями перед важной датой.',
                startColor: const Color(0xFFE9E4F0),
                endColor: const Color(0xFFF0ECF5),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP CREATE (Собери сам)',
                description: 'Хотите участвовать, но без перегруза? Выбирайте настроение, место, уровень сюрприза, а JUP соберет сценарий.',
                startColor: const Color(0xFFC9E1C9),
                endColor: const Color(0xFFB8D3B8),
              ),
              const SizedBox(width: 12),
              _PackageCard(
                title: 'JUP PRIVATE (Премиум)',
                description: 'Персональный контроль за отношениями: живой куратор, AI-психолог + человек, индивидуальные сценарии, приоритет.',
                startColor: const Color(0xFF4B423F),
                endColor: const Color(0xFF3D3632),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String description;
  final Color startColor;
  final Color endColor;

  const _PackageCard({super.key, required this.title, required this.description, required this.startColor, required this.endColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          highlightColor: Colors.white.withOpacity(0.2),
          splashColor: Colors.white.withOpacity(0.3),
          onTap: () {
            // TODO: Добавить функциональность нажатия на карточку пакета
            print('Нажата карточка пакета: $title');
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3D3632)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description,
                        style: TextStyle(fontSize: 16, color: const Color(0xFF3D3632).withOpacity(0.8), height: 1.4),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.arrow_forward_ios, color: const Color(0xFF3D3632).withOpacity(0.6), size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
