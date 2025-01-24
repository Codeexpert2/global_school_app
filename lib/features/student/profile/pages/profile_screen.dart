import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import 'package:global_school/components/images/cached_image.dart';
import 'package:global_school/components/main/app_divider.dart';
import 'package:global_school/components/main/main_appbar.dart';
import 'package:global_school/core/enums/alert_dialog_type.dart';
import 'package:global_school/core/extensions/extensions.dart';
import 'package:global_school/core/router/app_routes.dart';
import 'package:global_school/core/themes/app_colors.dart';
import 'package:global_school/core/utils/confirm_dialog.dart';
import 'package:global_school/features/student/profile/widgets/profile_item.dart';
import 'package:global_school/features/auth/providers/auth_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const MainAppBar(
        // title: S.of(context).profile,
        // actions: [
        //   //
        // ],
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.only(top: kToolbarHeight),
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            // color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            children: [
              ClipOval(
                child: CachedImage(
                  imageUrl: '',
                  width: context.width * 0.25,
                  height: context.width * 0.25,
                ),
              ),
              const SizedBox(height: 12),
              // Text(
              //   '${user?.firstName} ${user?.lastName}',
              //   style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 16,
              //   ),
              // ),
              // TextButton(
              //   onPressed: () => context.pushNamed(
              //     AppRoutes.updateProfile.name,
              //   ),
              //   child: Text(
              //     'تعديل الملف الشخصي',
              //     textAlign: TextAlign.center,
              //     style: Theme.of(context).textTheme.bodyLarge,
              //   ),
              // ),
              const SizedBox(height: 12),
              Column(
                children: [
                  ProfileItem(
                    icon: Icons.help_outline_rounded,
                    title: '',
                    subtitle: 'المساعدة',
                    onTap: () => context.pushNamed(
                      AppRoutes.help.name,
                    ),
                  ),
                  ProfileItem(
                    icon: Icons.ios_share,
                    title: '',
                    subtitle: 'شارك التطبيق',
                    onTap: () {
                      final box = context.findRenderObject() as RenderBox?;

                      Share.share(
                        'https://play.google.com/',
                        sharePositionOrigin:
                            box!.localToGlobal(Offset.zero) & box.size,
                      );
                    },
                  ),
                  ProfileItem(
                    icon: Icons.info_outline,
                    title: '',
                    subtitle: 'حول التطبيق',
                    onTap: () => context.pushNamed(
                      AppRoutes.about.name,
                    ),
                  ),
                  ProfileItem(
                    icon: Icons.password_rounded,
                    title: '',
                    subtitle: 'تغيير كلمة المرور',
                    onTap: () => context.pushNamed(
                      AppRoutes.changePassword.name,
                    ),
                  ),
                  ProfileItem(
                    icon: Icons.co_present_rounded,
                    title: '',
                    subtitle: 'الشروط والأحكام',
                    onTap: () => context.pushNamed(
                      AppRoutes.termsConditions.name,
                    ),
                  ),
                  ProfileItem(
                    icon: Icons.privacy_tip_outlined,
                    title: '',
                    subtitle: 'privacyPolicy',
                    onTap: () => context.pushNamed(
                      AppRoutes.privacyPolicy.name,
                    ),
                  ),
                  const AppDivider(),
                  ProfileItem(
                    icon: Icons.privacy_tip_outlined,
                    title: '',
                    subtitle: 'تسجيل خروج',
                    color: AppColors.error600,
                    onTap: () async {
                      final bool? confirmed = await showDialog<bool>(
                        context: context,
                        useRootNavigator: true,
                        builder: (ctx) => CustomAlertDialog(
                          title: 'Confirm logout',
                          description: 'Are you sure you want to logout ?',
                          acceptText: 'Logout',
                          cancelText: 'Cancel',
                          type: AlertDialogType.error,
                          onAccept: () {
                            // Handle account deletion logic here
                            debugPrint('Account logout.');
                            ref.read(authNotifierProvider.notifier).logout();
                          },
                        ),
                      );
                    },
                  ),
                  // ProfileItem(
                  //   icon: Icons.person_remove_alt_1_rounded,
                  //   title: '',
                  //   subtitle: 'Delete Account',
                  //   color: AppColors.error600,
                  //   onTap: () async {
                  //     final bool? confirmed = await showDialog<bool>(
                  //       context: context,
                  //       useRootNavigator: true,
                  //       builder: (ctx) => CustomAlertDialog(
                  //         title: 'Confirm Delete Account',
                  //         description:
                  //             'Are you sure you want to permanently delete your account? This action cannot be undone.',
                  //         acceptText: 'Delete',
                  //         cancelText: 'Cancel',
                  //         type: AlertDialogType.error, // Type is Error
                  //         onAccept: () {
                  //           // Handle account deletion logic here
                  //           debugPrint('Account deleted.');
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
