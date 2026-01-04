import 'package:flutter/material.dart';
import 'package:jup/features/home/domain/entities/moment.dart';
import 'package:jup/features/home/presentation/providers/home_provider.dart';
import 'package:jup/features/home/presentation/widgets/ai_assistant_card.dart';
import 'package:jup/features/home/presentation/widgets/banners_section.dart';
import 'package:jup/features/home/presentation/widgets/create_event_section.dart';
import 'package:jup/features/home/presentation/widgets/empty_moment_widget.dart';
import 'package:jup/features/home/presentation/widgets/moment_card.dart';
// import 'package:jup/features/home/presentation/widgets/packages_section.dart'; // Old import, remove or comment out
import 'package:jup/features/packages/presentation/widgets/packages_section.dart'; // New import for PackagesSection
import 'package:jup/features/home/presentation/widgets/tips_section.dart';
import 'package:jup/features/home/presentation/widgets/countdown_dialog.dart';
import 'package:jup/features/home/presentation/widgets/dress_code_detail_dialog.dart';
import 'package:jup/features/home/presentation/widgets/status_roadmap_bottom_sheet.dart';
import 'package:jup/features/home/presentation/widgets/home_loading_shimmer.dart'; // Импортируем новый виджет
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart'; // Больше не нужен здесь, так как он внутри HomeLoadingShimmer

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeProvider>().fetchNextMoment();
    });
  }

  void _handleInfoChipTap(String type, Moment? moment) {
    if (type == 'countdown') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          final targetDate = (moment?.date != null && moment!.date.isNotEmpty)
              ? DateTime.now().add(const Duration(days: 3))
              : DateTime.now().add(const Duration(days: 3));
          return CountdownDialog(targetDate: targetDate);
        },
      );
    } else if (type == 'dress_code' && moment != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return DressCodeDetailDialog(dressCode: moment.dressCode);
        },
      );
    }
  }

  void _showStatusRoadmapBottomSheet(Moment moment) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SafeArea(child: StatusRoadmapBottomSheet(moment: moment));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1EE),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.state == HomeState.loading || provider.state == HomeState.initial) {
            return const HomeLoadingShimmer();
          }
          if (provider.state == HomeState.error) {
            return Center(child: Text(provider.errorMessage));
          }
          return CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: provider.moment != null
                      ? NextMomentCard(
                    moment: provider.moment!,
                    onInfoChipTap: (type) => _handleInfoChipTap(type, provider.moment!),
                    onStatusTap: (moment) => _showStatusRoadmapBottomSheet(moment),
                  )
                      : const EmptyStateMoment(),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
              const SliverToBoxAdapter(child: CreateEventSection()),
              const SliverToBoxAdapter(child: PackagesSection()),
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 32, 16, 0),
                sliver: SliverToBoxAdapter(child: AiAssistantCard()),
              ),
              const SliverToBoxAdapter(child: BannersSection()),
              const SliverToBoxAdapter(child: TipsSection()),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          );
        },
      ),
    );
  }
}
