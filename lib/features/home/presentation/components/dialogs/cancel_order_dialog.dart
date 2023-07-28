import 'package:flutter/material.dart';

import '../../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/routing/navigation_service.dart';
import '../../../../../core/presentation/styles/font_styles.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';

class CancelOrderDialog extends HookWidget {
  const CancelOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cancelNoteController = useTextEditingController(text: '');

    return SizedBox(
      width: Sizes.dialogWidth280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText.f16(
            context,
            '${tr(context).reasonForCancelingTheOrder}:',
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          TextFormField(
            key: const ValueKey('cancel_note'),
            controller: cancelNoteController,
            decoration: InputDecoration(
              hintText: '${tr(context).typeYourNote}...',
            ),
            textInputAction: TextInputAction.newline,
            minLines: 1,
            maxLines: 6,
            maxLength: 200,
          ),
          const SizedBox(
            height: Sizes.marginV20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.paddingH8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: CustomElevatedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.buttonPaddingV12,
                      horizontal: Sizes.buttonPaddingH34,
                    ),
                    buttonColor: customColors(context).greyColor,
                    onPressed: () {
                      NavigationService.popDialog(context);
                    },
                    child: CustomText.f16(
                      context,
                      tr(context).cancel,
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightSemiBold,
                    ),
                  ),
                ),
                Flexible(
                  child: CustomElevatedButton(
                    enableGradient: true,
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.buttonPaddingV12,
                      horizontal: Sizes.buttonPaddingH34,
                    ),
                    onPressed: () {
                      NavigationService.popDialog(context, result: cancelNoteController.text);
                    },
                    child: CustomText.f16(
                      context,
                      tr(context).confirm,
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightSemiBold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
