import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Новый виджет для эффекта загрузки Shimmer
class HomeLoadingShimmer extends StatelessWidget {
  const HomeLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!, // Базовый цвет для эффекта
      highlightColor: Colors.grey[100]!, // Цвет подсветки
      child: CustomScrollView(
        slivers: [
          // 1. NextMomentCard Placeholder
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 200, // Примерная высота NextMomentCard
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
            ),
          ),

          // 2. Spacer
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // 3. CreateEventSection Placeholder
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 150, height: 24, color: Colors.white), // Заголовок
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 130, // Высота для списка карточек событий
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 4. Spacer
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // 5. PackagesSection Placeholder
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 200, height: 24, color: Colors.white), // Заголовок
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180, // Высота для списка карточек пакетов
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Container(
                        width: 270,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 6. Spacer
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // 7. AiAssistantCard Placeholder
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 100, // Примерная высота AiAssistantCard
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
              ),
            ),
          ),

          // 8. Spacer
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // 9. BannersSection Placeholder (имитация 2-3 баннеров)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 180, height: 24, color: Colors.white), // Заголовок
                  const SizedBox(height: 16),
                  Column( // Имитация списка баннеров
                    children: List.generate(3, (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: Container(
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                      ),
                    )),
                  ),
                ],
              ),
            ),
          ),

          // 10. Spacer
          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          // 11. TipsSection Placeholder
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 160, height: 24, color: Colors.white), // Заголовок
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 190, // Высота для списка карточек советов
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) => Container(
                        width: 220,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
