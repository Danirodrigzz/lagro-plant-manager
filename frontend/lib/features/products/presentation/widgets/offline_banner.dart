import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lagro_plant_manager/core/providers/connectivity_provider.dart';
import 'package:lagro_plant_manager/core/theme/app_colors.dart';

class OfflineBanner extends ConsumerWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(isOfflineProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOut,
      child: isOffline
          ? Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: isDark 
                    ? Colors.red.withOpacity(0.15) 
                    : AppColors.error.withOpacity(0.08),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.error.withOpacity(0.2),
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Icon(
                    Icons.wifi_off_rounded,
                    size: 18,
                    color: isDark ? Colors.redAccent : AppColors.error,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Sin conexión — modo lectura activado',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.redAccent : AppColors.error,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(height: 0, width: double.infinity),
    );
  }
}
