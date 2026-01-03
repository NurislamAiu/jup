import 'package:flutter/material.dart';

class TipsSection extends StatelessWidget {
  const TipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 16), // Оптимизированный нижний отступ
          child: Text(
            'Советы для души', // Более умеренный и глубокомысленный заголовок
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3D3632), letterSpacing: 0.2), // Сдержанный, но выразительный
          ),
        ),
        SizedBox(
          height: 190, // Увеличена высота для карточек, чтобы избежать переполнения
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              SizedBox(width: 12), // Отступ между краем и первой карточкой
              _TipCard(
                text: 'Иногда внимание важнее плана. Прислушайтесь к сердцу, оно подскажет.',
              ),
              SizedBox(width: 12),
              _TipCard(
                text: 'Небольшой сюрприз может создать большое воспоминание, способное согревать долго.',
              ),
              SizedBox(width: 12),
              _TipCard(
                text: 'Умение слушать — это отдельная форма любви, которая укрепляет связь.',
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }
}

class _TipCard extends StatelessWidget {
  final String text;

  const _TipCard({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Оптимизированная ширина карточки
      margin: const EdgeInsets.symmetric(horizontal: 0), // Отступы управляются ListView
      decoration: BoxDecoration(
        color: Colors.white, // Чистый белый фон
        borderRadius: BorderRadius.circular(20), // Умеренные закругления
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04), // Очень деликатная тень
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: const Color(0xFFD4A373).withOpacity(0.08), // Очень легкий акцент при нажатии
          splashColor: const Color(0xFFD4A373).withOpacity(0.15), // Мягкий эффект ряби
          onTap: () {
            // TODO: Добавить функциональность нажатия на карточку совета
            print('Нажата карточка совета: $text');
          },
          child: Padding(
            padding: const EdgeInsets.all(24), // Оптимизированные отступы внутри карточки
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Выравниваем текст по центру вертикально
              children: [
                // Убрана декоративная иконка для более серьезного вида
                Text(
                  text,
                  textAlign: TextAlign.center, // Выравниваем текст по центру
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3D3632),
                    height: 1.5, // Увеличенный межстрочный интервал для лучшей читаемости
                  ),
                  maxLines: 5, // Увеличен лимит строк
                  overflow: TextOverflow.ellipsis, // Обрезка текста
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
