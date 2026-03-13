import 'package:flutter/material.dart';
import 'package:getx_practice/utls/colors.dart';

class NexusAppBar extends StatefulWidget implements PreferredSizeWidget {
  const NexusAppBar({super.key});

  @override
  State<NexusAppBar> createState() => _NexusAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _NexusAppBarState extends State<NexusAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlack,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: TextStyle(fontSize: 12)),
              Text(
                "Test User",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
