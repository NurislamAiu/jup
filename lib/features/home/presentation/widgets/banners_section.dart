import 'package:flutter/material.dart';

class BannersSection extends StatelessWidget {
  const BannersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 32, 20, 16),
          child: Text(
            'Забота и Внимание',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3D3632),
              letterSpacing: 0.3,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _BannerCard(
                title: 'Цветы и Забота',
                assetPath: 'assets/images/icon_enjoy.png',
              ),
              const SizedBox(height: 14),
              _BannerCard(
                title: 'Адвент-календари',
                assetPath: 'assets/images/calendar.png',
              ),
              const SizedBox(height: 14),
              _BannerCard(
                title: 'Домашние впечатления',
                assetPath: 'assets/images/home_experience.png',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BannerCard extends StatelessWidget {
  final String title;
  final String assetPath;

  const _BannerCard({super.key, required this.title, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
          highlightColor: const Color(0xFFD4A373).withOpacity(0.1),
          splashColor: const Color(0xFFD4A373).withOpacity(0.2),
          onTap: () {
            print('Нажат баннер: $title');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Image.asset(assetPath, width: 46, height: 46),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF3D3632),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF4B423F).withOpacity(0.6),
                  size: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
