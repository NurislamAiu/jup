import 'package:flutter/material.dart';
import 'package:jup/features/home/domain/entities/moment.dart';
import 'dart:ui';

class NextMomentCard extends StatelessWidget {
  final Moment moment;
  final Function(String type)? onInfoChipTap;
  final Function(Moment moment)? onStatusTap;

  const NextMomentCard({super.key, required this.moment, this.onInfoChipTap, this.onStatusTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFEAE2DD), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  moment.date.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8A7F79),
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Тихий Ужин',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3D3632),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: Color(0xFFEAE2DD)),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _InfoChip(label: 'Обратный отсчет', value: '3 days left', isToggleable: false, onChipTap: () => onInfoChipTap?.call('countdown'))),
                    const SizedBox(width: 16),
                    Expanded(child: _InfoChip(label: 'Дресс-код', value: moment.dressCode, isToggleable: true, onChipTap: () => onInfoChipTap?.call('dress_code'))),
                  ],
                ),
                const SizedBox(height: 28),
                _StatusIndicator(status: moment.status, onTap: () => onStatusTap?.call(moment)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoChip extends StatefulWidget {
  final String label;
  final String value;
  final bool isToggleable;
  final VoidCallback? onChipTap; // Новый колбэк для обработки нажатия

  const _InfoChip({
    super.key,
    required this.label,
    required this.value,
    this.isToggleable = false,
    this.onChipTap, // Сделать его необязательным
  });

  @override
  State<_InfoChip> createState() => _InfoChipState();
}

class _InfoChipState extends State<_InfoChip> {
  bool _isRevealed = false;

  @override
  void initState() {
    super.initState();
    _isRevealed = !widget.isToggleable;
  }

  @override
  Widget build(BuildContext context) {
    const double _valueSectionHeight = 20.0;

    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label.toUpperCase(),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8A7F79),
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: _valueSectionHeight,
          child: widget.isToggleable
              ? AnimatedCrossFade(
                  firstChild: const Text(
                    'Секретно',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFD4A373),
                    ),
                  ),
                  secondChild: Text(
                    widget.value,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D3632),
                    ),
                  ),
                  crossFadeState: _isRevealed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                )
              : Text(
                  widget.value,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3D3632),
                  ),
                ),
        ),
      ],
    );

    return GestureDetector(
      onTap: () {
        if (widget.isToggleable) {
          setState(() {
            _isRevealed = !_isRevealed;
          });
        }
        widget.onChipTap?.call(); // Вызываем переданный колбэк
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F1EE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: content,
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final dynamic status;
  final VoidCallback? onTap; // Новый колбэк для обработки нажатия на индикатор статуса

  const _StatusIndicator({super.key, required this.status, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Привязываем колбэк к GestureDetector
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF4B423F),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xFFD4A373),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 14),
            const Text(
              'Подготовка',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const Spacer(),
            const Text(
              'Все под контролем',
              style: TextStyle(
                fontSize: 13,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}