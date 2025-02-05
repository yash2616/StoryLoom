import 'package:flutter/material.dart';
import 'package:storyloom/utilities/screen_size_util.dart';
import 'package:storyloom/utilities/theme/app_colors.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final ValueNotifier<int> sectionSwitch = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primaryColor,
              AppColors.kNavyColor1,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 28,
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.settings,
                      size: 32,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Text(
              'Make your\nE-Bookshelf!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade200,
                fontSize: 42,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade200.withOpacity(0.3))
              ),
              child: Row(
                children: [
                  HomeSectionSwitchButton(
                    section: 0,
                    sectionSwitch: sectionSwitch,
                  ),
                  const SizedBox(width: 6,),
                  HomeSectionSwitchButton(
                    section: 1,
                    sectionSwitch: sectionSwitch,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeSectionSwitchButton extends StatelessWidget {
  const HomeSectionSwitchButton({
    super.key, required this.sectionSwitch, required this.section,
  });

  final ValueNotifier<int> sectionSwitch;
  final int section;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          if(sectionSwitch.value != section) sectionSwitch.value = section;
        },
        child: ValueListenableBuilder(
          valueListenable: sectionSwitch,
          builder: (context, _, __) {
            final bool isSelected = sectionSwitch.value == section;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInSine,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: isSelected ? Colors.grey.shade200 : Colors.transparent,
              ),
              alignment: Alignment.center,
              child: Text(
                section == 0 ? 'Books' : 'Audio',
                style: TextStyle(
                  color: !isSelected ? Colors.grey.shade200 : AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
