import 'package:auto_route/auto_route.dart';
import 'package:base_clean_bloc/common/constants.dart';
import 'package:base_clean_bloc/features/home/presentation/pages/home_screen_constants.dart';
import 'package:base_clean_bloc/features/home/presentation/widgets/large_category_item.dart';
import 'package:base_clean_bloc/features/home/presentation/widgets/small_category_item.dart';
import 'package:base_clean_bloc/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  final ValueNotifier<double> _statusBarOpacity = ValueNotifier(1.0);

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    _statusBarOpacity.value = (1.sh - _controller.pixels) / HomeScreenConstants.controllerOpacityHeight;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _statusBarOpacity,
        builder: (context, value, _) {
          return AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.white.withOpacity(1 - value),
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
                extendBodyBehindAppBar: true,
                body: Stack(
                  children: [
                    Assets.images.homeHeaderImage.image(
                      height: HomeScreenConstants.homeHeaderImageSize.height,
                      width: HomeScreenConstants.homeHeaderImageSize.width,
                      fit: BoxFit.fitWidth,
                    ),
                    DraggableScrollableSheet(
                      key: _sheet,
                      controller: _controller,
                      shouldCloseOnMinExtent: false,
                      initialChildSize: HomeScreenConstants.dragSheetRatio,
                      minChildSize: HomeScreenConstants.dragSheetRatio,
                      expand: true,
                      snap: true,
                      builder: (context, scrollController) {
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 8, top: 12),
                              height: 4,
                              width: 32,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                            ),
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(kRadius16 * value),
                                    topRight: Radius.circular(kRadius16 * value),
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  controller: scrollController,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: kSpace16, top: kSpace16, right: kSpace16),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: LargeCategoryItem(
                                                icon: Assets.icons.eraser.svg(),
                                                title: const Text("Xóa vật thể"),
                                              ),
                                            ),
                                            const SizedBox(width: kSpace16),
                                            Expanded(
                                              child: LargeCategoryItem(
                                                icon: Assets.icons.eraser.svg(),
                                                title: const Text("Xóa vật thể"),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: kSpace24,
                                      ),
                                      SizedBox(
                                        height: 60,
                                        child: ListView.separated(
                                          shrinkWrap: true,
                                          padding: HomeScreenConstants.smallCategoryItemListPadding,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              width: HomeScreenConstants.smallCategoryItemWidth,
                                              child: SmallCategoryItem(
                                                icon: Assets.icons.eraser.svg(),
                                                title: const Text("Xóa nền"),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) => const SizedBox(
                                            width: kSpace16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  ],
                )),
          );
        });
  }
}
