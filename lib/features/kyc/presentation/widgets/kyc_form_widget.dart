import 'dart:async';
import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/mixin/file_upload_mixin.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/functions.dart';
import 'package:paperless_listings/core/utils/widget_view.dart';
import 'package:paperless_listings/features/global/presentation/widgets/global_button_widget.dart';
import 'package:paperless_listings/features/kyc/presentation/data/kyc_contants.dart';
import 'package:paperless_listings/features/kyc/presentation/data/models/id_type_model.dart';
import 'package:paperless_listings/features/kyc/presentation/data/store/kyc_cubit.dart';
import 'package:paperless_listings/features/kyc/presentation/data/store/kyc_state.dart';
import 'package:responsive_builder/responsive_builder.dart';

class KYCFormWidget extends StatefulWidget {

  const KYCFormWidget({Key? key}) : super(key: key);

  @override
  KYCFormWidgetController createState() => KYCFormWidgetController();
}

////////////////////////////////////////////////////////
/// View is dumb, and purely declarative.
/// Easily references values on the controller and widget
////////////////////////////////////////////////////////

class _KYCFormWidgetView extends WidgetView<KYCFormWidget, KYCFormWidgetController> {

  const _KYCFormWidgetView(KYCFormWidgetController state) : super(state);

  @override
  Widget build(BuildContext context) {

    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;

    return Form(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Verify your identity', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        Text('For you to post a listing we require you to upload an identification document', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        SizedBox(height: isMobile ? 20 : 30,),
        Text('Select document type', style: theme.textTheme.titleMedium,),
        const SizedBox(height: 20,),
        dropDownField(context),

        SizedBox(height: isMobile ? 0 : 20,),

        if(isMobile) ...{
          frontOfCartWidget(context),
          backOfCartWidget(context),
        }else ... {
          Row(
             children: [
                Expanded(child: frontOfCartWidget(context)),
                const SizedBox(width: 20,),
                Expanded(child: backOfCartWidget(context)),
             ],
          )
        },

        SizedBox(height: isMobile ? 20 : 20,),

        ValueListenableBuilder<String?>(valueListenable: state.errorText, builder: (ctx, error, ch) {
          return Column(
            mainAxisSize: MainAxisSize.min,
             children: [
              if(error != null) ...{
                Text(error, style: const TextStyle(color: Colors.red),),
                SizedBox(height: isMobile ? 20 : 20,),
              }
             ],
          );
        }),



        /// Submit button
        BlocBuilder<KYCCubit, KYCState>(
          bloc: state.kycCubit,
          builder: (context, kycState) {
            return GlobalButtonWidget(
              // show loader when uploading image
              loading: kycState.status == BlocStatus.uploadingIDInProgress,
              text: 'Submit', onPressed: state.handleSubmit, expand: true, showOutline: false,);
          },
        )

      ],
    ));

  }
  
  Widget dropDownField(BuildContext context) {
    return  DropdownButtonFormField2(
      decoration: InputDecoration(
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: const Text(
        'Select Your ID Card',
        style: TextStyle(fontSize: 14),
      ),
      items: idTypes.map((item) => DropdownMenuItem<IDTypeModel>(
        value: item,
        child: Text(
          item.name,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select gender.';
        }
        return null;
      },
      onChanged: (value) {
        state.selectedIdType = value;
      },
      buttonStyleData: const ButtonStyleData(
        height: 60,
        padding: EdgeInsets.only(left: 20, right: 10),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
  
  Widget frontOfCartWidget(BuildContext context) {
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;

    return LayoutBuilder(
      builder: (ctx, ctr) {
        return GestureDetector(
          onTap: () => state.handleSelectFrontIdCard(),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50),
            margin: EdgeInsets.only(left: isMobile ? 20 : 0, right: isMobile ? 20 : 0, top: isMobile ? 20 : 30, bottom: isMobile ? 10 : 20),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8)
            ),
            child: ValueListenableBuilder<Map<String, dynamic>?>(valueListenable: state.frontIdImage, builder: (ctx, file, ch) {
              if(file != null) {
                return Stack(
                  children: [
                    file.containsKey('asBytes') ? Image.memory(file['asBytes'] as Uint8List) : Image.file(file['asFile'], fit: BoxFit.cover,),
                    Positioned(top: 0,
                      right: 0,child: IconButton(onPressed: () {
                        state.frontIdImage.value = null;
                      }, icon: const Icon(Icons.highlight_remove,  color: Colors.red,)),
                    )
                  ],
                );
              }
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 100, height: 100,
                      child: Image.asset('assets/img/id_front.png', ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('upload an image of the front',textAlign: TextAlign.center),
                    )
                  ],
                ),
              );
            })
          ),
        );
      }
    );
  }

  Widget backOfCartWidget(BuildContext context) {
    final theme = themeOf(context);
    final size = sizeOfMediaQuery(context);
    final isMobile = getDeviceType(size) == DeviceScreenType.mobile;

    return LayoutBuilder(
        builder: (ctx, ctr) {
          return GestureDetector(
            onTap: () => state.handleSelectBackIdCard(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              margin: EdgeInsets.only(left: isMobile ? 20 : 0, right: isMobile ? 20 : 0, top: isMobile ? 10 : 30, bottom: isMobile ? 20 : 20),
              decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: ValueListenableBuilder<Map<String, dynamic>?>(valueListenable: state.backIdImage, builder: (ctx, file, ch) {
                if(file != null) {
                  return Stack(
                      children: [
                        file.containsKey('asBytes') ? Image.memory(file['asBytes'] as Uint8List) : Image.file(file['asFile'], fit: BoxFit.cover,),
                        Positioned(top: 0,
                            right: 0,child: IconButton(onPressed: () {
                          state.backIdImage.value = null;
                          }, icon: const Icon(Icons.highlight_remove, color: Colors.red,)),
                        )
                      ],
                  );
                }
                return  Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 100, height: 100,
                        child: Image.asset('assets/img/id_back.png', ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text('upload an image of the back',textAlign: TextAlign.center),
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        }
    );
  }

}

////////////////////////////////////////////////////////
/// Controller holds state, and all business logic
////////////////////////////////////////////////////////

class KYCFormWidgetController extends State<KYCFormWidget> with FileUploadMixin {

  ValueNotifier<Map<String, dynamic>?> frontIdImage = ValueNotifier(null);
  ValueNotifier<Map<String, dynamic>?> backIdImage = ValueNotifier(null);
  IDTypeModel? selectedIdType;
  ValueNotifier<String?> errorText = ValueNotifier(null);

  late KYCCubit kycCubit;
  late StreamSubscription<KYCState> kycStateStreamSubscription;

  @override
  Widget build(BuildContext context) => _KYCFormWidgetView(this);

  @override
  void initState() {
    super.initState();
    kycCubit = context.read<KYCCubit>();
    kycStateStreamSubscription = kycCubit.stream.listen((event) {
      if(event.status == BlocStatus.uploadingIDSuccessful) {
        errorText.value = "Upload successful";
        frontIdImage.value = null;
        backIdImage.value = null;
      }
      if(event.status == BlocStatus.uploadingIDFailed) {
        errorText.value = "Upload Failed";
      }
    });
  }

  void handleSelectFrontIdCard() async {
    displaySelectFileOptions(context, onFilePicked: (file) {
      frontIdImage.value = {
        'asFile' : file
      };
    }, onFilePickedAsBytes: (file) {
      frontIdImage.value = {
        'asBytes' : file
      };
    }, onlyImage: true);
  }

  void handleSelectBackIdCard() {
    displaySelectFileOptions(context, onFilePicked: (file) {
      backIdImage.value = {
        'asFile' : file
      };
    }, onFilePickedAsBytes: (file) {
      backIdImage.value = {
        'asBytes' : file
      };
    }, onlyImage: true);
  }

  void handleSubmit() {
    if(selectedIdType == null) {
      errorText.value = "Please select an Id type";
      return;
    }
    if(frontIdImage.value == null) {
      errorText.value = "Please attach a front image";
      return;
    }
    if(backIdImage.value == null) {
      errorText.value = "Please attach a back image";
      return;
    }

    kycCubit.uploadFiles(
      asFile: frontIdImage.value!.containsKey('asFile'),
      frontFile: frontIdImage.value!.containsKey('asFile') ? frontIdImage.value!['asFile'] : null,
      frontFileAsBytes: frontIdImage.value!.containsKey('asBytes') ? frontIdImage.value!['asBytes'] : null,
      backFile: backIdImage.value!.containsKey('asFile') ? backIdImage.value!['asFile'] : null,
      backFileAsBytes: backIdImage.value!.containsKey('asBytes') ? backIdImage.value!['asBytes'] : null,
    );

  }

  @override
  void dispose() {
    super.dispose();
    kycStateStreamSubscription.cancel();
  }

}