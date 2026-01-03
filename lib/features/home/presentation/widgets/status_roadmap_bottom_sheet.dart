import 'package:flutter/material.dart';
import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/domain/entities/moment_status.dart';

class StatusRoadmapBottomSheet extends StatelessWidget {
  final Moment moment;
  const StatusRoadmapBottomSheet({super.key, required this.moment});

  // Метод для получения текста шага
  String _getStepText(MomentStatus status) {
    switch (status) {
      case MomentStatus.preparing:
        return 'Начало: Зарождение идеи';
      case MomentStatus.ready:
        return 'Организация: Все в процессе';
      case MomentStatus.today:
        return 'Кульминация: Событие уже сегодня!';
      default:
        return 'Неизвестный этап';
    }
  }

  // Вспомогательный виджет для отображения отдельного шага с линией-коннектором и описанием
  Widget _buildRoadmapStep(
      BuildContext context, int stepNumber, String title, String description, bool isActive, bool isCompleted, bool showConnector) {
    const Color primaryColor = Color(0xFFD4A373);
    const Color secondaryColor = Color(0xFF8A7F79);
    const Color inactiveColor = Color(0xFFEAE2DD);
    const Color textColor = Color(0xFF3D3632);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Индикатор шага
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isCompleted
                    ? primaryColor
                    : isActive
                        ? primaryColor
                        : inactiveColor,
                shape: BoxShape.circle,
                border: isActive ? Border.all(color: textColor, width: 2) : null,
              ),
              child: Center(
                child: isCompleted
                    ? const Icon(Icons.check, color: Colors.white, size: 20)
                    : isActive
                        ? Text(
                            stepNumber.toString(),
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                          )
                        : Text(
                            stepNumber.toString(),
                            style: TextStyle(color: textColor.withOpacity(0.7), fontWeight: FontWeight.bold, fontSize: 18),
                          ),
              ),
            ),
            const SizedBox(width: 16),
            // Название и описание шага
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
                      color: isActive || isCompleted ? textColor : secondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isActive || isCompleted ? Colors.grey[700] : Colors.grey[500],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Линия-коннектор (если не последний шаг)
        if (showConnector)
          Padding(
            padding: const EdgeInsets.only(left: 17, top: 4, bottom: 4),
            child: Container(
              width: 2,
              height: 40,
              decoration: BoxDecoration(
                color: isCompleted ? primaryColor.withOpacity(0.7) : inactiveColor.withOpacity(0.7),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> roadmapSteps = [
      {
        'status': MomentStatus.preparing,
        'title': 'Зарождение идеи',
        'description': 'На этом этапе мы собираем все ваши пожелания и начинаем формировать концепцию.'
      },
      {
        'status': MomentStatus.ready,
        'title': 'Детализация и бронирование',
        'description': 'Подбираем места, договариваемся с подрядчиками и утверждаем все мелочи.'
      },
      {
        'status': MomentStatus.today,
        'title': 'Предвкушение чуда!',
        'description': 'Все готово! Остались последние штрихи и ожидание вашего незабываемого дня.'
      },
    ];

    int currentStatusIndex = roadmapSteps.indexWhere((step) => step['status'] == moment.status);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 60,
              height: 5,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  'Ваш путь к идеальному свиданию',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF3D3632)),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Color(0xFF3D3632)),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Проследите за каждым шагом подготовки вашего особого момента.',
            style: TextStyle(fontSize: 15, color: Color(0xFF8A7F79)),
          ),
          const SizedBox(height: 32),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: roadmapSteps.length,
            itemBuilder: (context, index) {
              final step = roadmapSteps[index];
              bool isCompleted = index < currentStatusIndex;
              bool isActive = index == currentStatusIndex;
              bool showConnector = index < roadmapSteps.length - 1;

              return _buildRoadmapStep(
                  context, index + 1, step['title'], step['description'], isActive, isCompleted, showConnector);
            },
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Текущий статус: ${_getStepText(moment.status)}',
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
