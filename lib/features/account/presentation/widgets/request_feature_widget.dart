import 'package:flutter/material.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_button_widget.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_text_field_widget.dart';

class RequestFeatureWidget extends StatelessWidget {
  const RequestFeatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffbe8ef),
        borderRadius: BorderRadius.circular(12),
      ),
      width: size.width * 0.18,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Do you have specific Need?', style: theme.textTheme.titleLarge,),
                  const SizedBox(height: 20,),
                  Text("If you have any specific feature you'd like to add to your listings, We are glad to help you. Please tell us exactly what you want", style: theme.textTheme.bodyMedium,),
                  const SizedBox(height: 20,),
                  Text('Feature request', style: theme.textTheme.titleMedium,),
                  const SizedBox(height: 10,),
                   TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      // hintStyle: TextStyle(color: kAppFaintBlack),
                      hintText: "Briefly describe what you want",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.colorScheme.outline, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.colorScheme.outline, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20,),
                  GlobalButtonWidget(text: 'Send', onPressed: (){}, showOutline: false,),
                  const SizedBox(height: 30,),
                ]
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset(kFeatureRequestDecoImage, fit: BoxFit.cover,)),
            )
        ],
      ),
    );
  }
}
