import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:paperless_listings/core/utils/extensions.dart';
import 'package:paperless_listings/core/utils/theme.dart';
import 'package:paperless_listings/features/auth/data/repositories/auth_repository.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:timeago/timeago.dart' as timeago;


import 'constants.dart';
import 'enums.dart';

/// Use this method to execute code that requires context in init state
onWidgetBindingComplete({required Function() onComplete, int duration = 1000}){
  WidgetsBinding.instance.addPostFrameCallback((_) => Timer(Duration(milliseconds: duration), onComplete));
}

AuthRepository getAuthenticationApi(){
  return getIt<AuthRepository>();
}


bool containsOnlyCaps({required String text}) {
  RegExp regEx = RegExp(r"^[A-Z]*$");
  return regEx.hasMatch(text);
}

void showTechnicalIssueAlert(BuildContext ctx){
  showHandyAlertDialog(ctx, title: "Sorry!", content: "A technical issue occurred, please contact admin.");
}

void showErrorAlert(BuildContext ctx, {required String content, void Function()? okTapped}){
  showHandyAlertDialog(ctx, title: "Sorry!", content: content ?? "", okTapped: okTapped??(){});
}

void showSnackBarWithConnectionIssue(BuildContext ctx, {Color backgroundColor= accent}){
  showSnackBar(ctx, "Unable to connect. Try again later!", backgroundColor: backgroundColor);
}

void showSuccessAlert(BuildContext ctx, {required String content, void Function()? okTapped}){
  showHandyAlertDialog(ctx, title: "Done!", content: content, okTapped: okTapped??(){});
}

void showHandyAlertDialog(BuildContext context, {String title = "Please note", String content = "", void Function()? okTapped}){
  showDialog(context: context, builder: (ctx) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
      content: Text(content),
      actions: [

        TextButton(onPressed: (){
          Navigator.of(context).pop();
          okTapped??(){};
        }, child: const Text("OK"))
      ],
    );

  });

}


/// snackbar
void showSnackBar(BuildContext context, String message, {Color? background, Color? foreground, Appearance? appearance = Appearance.primary, Position position = Position.top,  Color? backgroundColor, bool action = false}) {

  var messenger = ScaffoldMessenger.of(context);
  final media = MediaQuery.of(context);

  messenger
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        // width: 200,
        duration: const Duration(milliseconds: 9000), // delay
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: appearance == null ? foreground ?? Theme.of(context).colorScheme.primary
                : kAppWhite,
          ),
        ),
        backgroundColor: appearance == null ? (background ?? Theme.of(context).colorScheme.onPrimary) :
        ((appearance == Appearance.error) ? kAppRed : ((appearance == Appearance.success) ? Colors.green : kAppBlue ))
        ,
        behavior: SnackBarBehavior.floating,
        action: action ? SnackBarAction(
          label: 'Dismiss',
          textColor: appearance == null ? (foreground ?? Theme.of(context).colorScheme.primary) : kAppWhite,
          onPressed: () => messenger.hideCurrentSnackBar(),
        ):null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        margin: position == Position.bottom ?   EdgeInsets.only(
            top: media.size.height - (media.size.height / 5),
            right: 20,
            left: 20) : null,
      ),
    );



}

/// convert figures in 1000s into k
String convertToCompactFigure(double numberToFormat) {

  final formattedNumber = NumberFormat.compactCurrency(
    decimalDigits: numberToFormat > 1000 ? 2 : 0,
    symbol: '',
  ).format(numberToFormat);

  return formattedNumber;
  // print('Formatted Number is: $_formattedNumber');

}


String getFirstLetter(String words) {
  if(blank(words)) {
    return words;
  }
  return words[0];
}

String getInitials(String words) {

  if(blank(words)) {
    return words;
  }

  try{
    List<String> names = words.split(" ");
    String initials = "";
    int numWords = 2;

    if(numWords < names.length) {
      numWords = names.length;
    }
    for(var i = 0; i < numWords; i++){
      if(names[i].isNotEmpty){
        initials += names[i][0];
      }
    }
    return initials;
  }catch(e){
    return words[0];
  }
}



String formatServiceToReadable(String service){
  final array = service.split('_');
  String str = '';
  for (var element in array) {
    str += element.capitalize();
    str += " ";
  }
  return str;
}


void showHandyConfirmDialog(BuildContext context, {String title = "Confirm", String content  = "", void Function()? okTapped, void Function()? onCancelTapped}){
  showDialog(context: context, builder: (ctx) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
      content: Text(content),
      actions: [

        // cancel button
        TextButton(onPressed: (){
          Navigator.of(context).pop();
          if(onCancelTapped != null){
            onCancelTapped();
          }
        }, child: const Text("Cancel")),

        // okay button
        TextButton(onPressed: (){
          Navigator.of(context).pop();
          if(okTapped != null){
            okTapped();
          }
        }, child: const Text("OK"))

      ],
    );
  });

}


/// Get formatted date
String getTimeAgo(DateTime date){

  final readableTime = timeago.format(date);
  return readableTime;

}

String getFormattedDateWithIntl(DateTime date, {String format = 'MMM yyyy'}){

  var formatBuild = DateFormat(format);
  var dateString = formatBuild.format(date);
  return dateString;

}


String toCurrencyFormat(String value, {bool showCurrency = true}){
  if(double.tryParse(value) == null) {
    return value;
  }

  final newValue = double.parse(value);

  final oCcy = NumberFormat("#,##0.00", "en_US");
  final oCcyResult = oCcy.format(newValue);
  //return "GHS ${.toStringAsFixed(2)}";
  return showCurrency ? "$currency $oCcyResult" : oCcyResult;
}



bool blank(dynamic text){
  if(text is bool){
    return text == false;
  }else if(text is DateTime){
    return text == null;
  }else if(text is TimeOfDay){
    return text == null;
  }
  return text == null || text == '' || text.length == 0;
}

ImagePickerFileType getFileType(String filePath){
  String? mimeStr = lookupMimeType(filePath);
  final fileType = mimeStr?.split('/');
  if(fileType !=null){
    return (fileType.contains('image')) ? ImagePickerFileType.image : ImagePickerFileType.document;
  }
  return ImagePickerFileType.document;
}

Size getScreenSize(BuildContext context) => MediaQuery.of(context).size;

void setAppSystemOverlay({bool useThemeOverlays = true, required ThemeData theme, bool strictlyUseDarkModeOverlays = false, strictlyUseLightModeOverlays = false}) {

  if(useThemeOverlays) {
    setSystemUIOverlays(
      statusBarColor: Colors.transparent,
      // for android only
      statusBarBrightness: theme.brightness,
      // IOS
      statusBarIconBrightness: theme.brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark,
      // For android //
      navigationBarColor: theme.colorScheme.background,
      // for android only
      navigationBarIconBrightness: // visible on android only
      theme.brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
    );
  }

  else if(strictlyUseDarkModeOverlays) {
    setSystemUIOverlays(
      statusBarColor: Colors.transparent,
      // for android only
      statusBarBrightness: Brightness.dark,
      // IOS
      statusBarIconBrightness: Brightness.light,
      // For android //
      navigationBarColor: theme.colorScheme.background,
      // for android only
      navigationBarIconBrightness: // visible on android only
      theme.brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light,
      );
    }

    else if(strictlyUseLightModeOverlays) {
      setSystemUIOverlays(
        statusBarColor: Colors.transparent,
        // for android only
        statusBarBrightness: Brightness.light,
        // IOS
        statusBarIconBrightness: Brightness.dark,
        // For android //
        navigationBarColor: theme.colorScheme.background,
        // for android only
        navigationBarIconBrightness: // visible on android only
        theme.brightness == Brightness.light
            ? Brightness.dark
            : Brightness.light,
      );
    }

}

double horizontalPadding(BuildContext context) {
  final size = sizeOfMediaQuery(context);
  final DeviceScreenType deviceType = getDeviceType(size);
  return deviceType == DeviceScreenType.mobile ? 20.0 : size.width * 0.2;
}

// String getDeviceType() {
//   final data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
//   return data.size.shortestSide < 600 ? 'phone' :'tablet';
// }

///MediaQuery Height
Size sizeOfMediaQuery(BuildContext context) {
  return MediaQuery.of(context).size;
}

/// Get theme
ThemeData themeOf(BuildContext context){
  return Theme.of(context);
}

/// Get arguments
Object? argumentsOf(BuildContext context) {
  return ModalRoute.of(context)?.settings.arguments;
}