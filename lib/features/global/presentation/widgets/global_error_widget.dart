import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GlobalErrorWidget extends StatelessWidget {

  final VoidCallback? onRefreshTapped;
  final String? message;
  final SharedErrorType errorType;
  const GlobalErrorWidget({
    this.onRefreshTapped,
    this.message,
    this.errorType = SharedErrorType.error,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;

    return Container(
      color: theme.colorScheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: isMobile ? Align(
        alignment: Alignment.topCenter,
        child: _body(context),
      ) : _body(context)
    );
  }

  Widget _body(BuildContext context) {
    final theme = Theme.of(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.info_outline, color: theme.colorScheme.onBackground, size: isMobile ? 35 : 50,),
        // Lottie.network("https://assets1.lottiefiles.com/private_files/lf30_cgfdhxgx.json"),
        const SizedBox(height: 10,),
        Text(message ?? (errorType == SharedErrorType.empty ? 'This place looks empty' : 'Please check your connection and tap on the refresh button below to reload'),
          textAlign: TextAlign.center,
          style: TextStyle(color: theme.colorScheme.onBackground),),
        if(onRefreshTapped != null) ... {
          const SizedBox(height: 10,),
          TextButton.icon(onPressed: () {
            onRefreshTapped?.call();
          }, icon: Icon(Icons.refresh, color: theme.colorScheme.onBackground,), label: Text('Refresh', style: TextStyle(color: theme.colorScheme.onBackground),))
        }
      ],
    );
  }

}
