import 'package:flutter/material.dart';
import 'package:jup/features/packages/domain/entities/package.dart';
import 'package:jup/features/packages/presentation/screens/package_detail_screen.dart';

class PackagesRoutes {
  static const String packageDetail = '/packageDetail';

  static Map<String, WidgetBuilder> get routes {
    return {
      packageDetail: (context) => PackageDetailScreen(
        package: ModalRoute.of(context)!.settings.arguments as Package,
      ),
    };
  }
}
