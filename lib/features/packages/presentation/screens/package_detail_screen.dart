import 'package:flutter/material.dart';
import 'package:jup/features/packages/domain/entities/package.dart'; // Updated import for Package

class PackageDetailScreen extends StatelessWidget {
  static const String routeName = '/packageDetail';
  final Package package;

  const PackageDetailScreen({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color textColor = package.startColor.computeLuminance() > 0.5 ? Colors.black87 : Colors.white; // Dynamic text color

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background, // Use theme background color
      extendBodyBehindAppBar: true, // Extend body behind transparent app bar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: textColor), // Dynamic back button color
          onPressed: () => Navigator.of(context).pop(),
        ),
        // No title in AppBar for a cleaner, integrated title below
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Gradient and Large Title
            Container(
              height: 300, // Increased height for a more impactful header
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [package.startColor, package.endColor], // Use package's colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(40)), // More rounded bottom corners
                boxShadow: [
                  BoxShadow(
                    color: package.endColor.withOpacity(0.4),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 80, left: 24, right: 24, bottom: 24), // Adjusted padding for title position
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end, // Align title to the bottom
                  children: [
                    Text(
                      package.title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w800, // Very bold
                        fontSize: 36,
                      ), // Large, bold title
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Узнайте больше о вашем приключении',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: textColor.withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24), // Space after header
                  Text(
                    'Описание пакета',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    package.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 32),
                  Divider(height: 1, thickness: 0.5, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)), // Lighter divider
                  const SizedBox(height: 32),
                  Text(
                    'Что входит',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 16),
                  _buildListItem(context, 'Консультация и выявление ваших предпочтений'),
                  _buildListItem(context, 'Разработка уникального сценария'),
                  _buildListItem(context, 'Бронирование и организация всех необходимых услуг'),
                  _buildListItem(context, 'Сопровождение и поддержка на всех этапах'),
                  _buildListItem(context, 'Персональный отчет после события'),
                  const SizedBox(height: 32),
                  Divider(height: 1, thickness: 0.5, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)), // Lighter divider
                  const SizedBox(height: 32),
                  Text(
                    'Как проходит',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Это место для более подробного описания процесса проведения пакета, что включает в себя, какие шаги предпринимаются, и что ожидать пользователю. Мы гарантируем полную конфиденциальность и индивидуальный подход к каждому клиенту.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 80), // Space for the floating button
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea( // Wrap with SafeArea to avoid phone buttons
        child: Padding(
          padding: const EdgeInsets.all(24.0), // Consistent padding
          child: ElevatedButton(
            onPressed: () {
              print('Заказать пакет: ${package.title}');
              // TODO: Implement actual order logic
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Запрос на пакет \'${package.title}\' отправлен!'),
                  backgroundColor: primaryColor,
                  behavior: SnackBarBehavior.floating, // Apple-style floating snackbar
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor, // Use theme primary color
              foregroundColor: Colors.white, // Text color on the button
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18), // Increased vertical padding for a substantial feel
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)), // More rounded corners
              minimumSize: const Size(double.infinity, 56), // Full width, slightly taller button
              elevation: 8, // Add a subtle shadow
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700), // Bolder text for button
            ),
            child: const Text(
              'Узнать больше / Заказать',
              style: TextStyle(color: Colors.white), // Explicitly white text
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for list items
  Widget _buildListItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, color: Theme.of(context).colorScheme.secondary, size: 20), // Use theme secondary for icon
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.5, color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
  }
}
