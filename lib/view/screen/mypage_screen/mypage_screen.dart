import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo/model/user.dart';
import 'package:flutter_todo/provider/local/local_provider.dart';
import 'package:flutter_todo/view/screen/mypage_screen/mypage_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends ConsumerWidget {
  const MyPageScreen({super.key});

  @override
  Widget build(context, ref) {
    final user = ref.watch(localUserProvider);
    final controller = ref.read(myPageControllerProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(user.username),
            pinned: true,
            expandedHeight: 100,
            elevation: 2,
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: Offset(0, -50),
              child: MyPageView(user: user),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('setting'),
              onTap: controller.openSetting,
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.badge),
              title: const Text('license'),
              onTap: () => showLicensePage(context: context),
            ),
          ),
          SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('signout'),
              onTap: controller.signOut,
              textColor: Theme.of(context).colorScheme.error,
              iconColor: Theme.of(context).colorScheme.error,
            ),
          ),
          if (kDebugMode)
            SliverToBoxAdapter(
              child: ListTile(
                leading: const Icon(Icons.flutter_dash),
                title: const Text('debug'),
                onTap: controller.openDebugPage,
              ),
            ),
        ],
      ),
    );
  }
}

class MyPageView extends StatelessWidget {
  const MyPageView({required this.user, super.key});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/50566499?v=4',
              height: 80,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  user.username,
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  '@${user.userId.value}',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
