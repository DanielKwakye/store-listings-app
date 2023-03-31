import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/injector.dart';
import 'package:paperless_listings/features/kyc/presentation/data/repositories/kyc_repository.dart';
import 'package:paperless_listings/features/kyc/presentation/data/store/kyc_state.dart';

class KYCCubit extends Cubit<KYCState> {

  final _kycRepository = sl<KYCRepository>();

  KYCCubit():super(const KYCState());

  void uploadFiles({required bool asFile, File? frontFile, Uint8List? frontFileAsBytes,  File? backFile, Uint8List? backFileAsBytes}) async {
    try {
      emit(state.copyWith(status: BlocStatus.uploadingIDInProgress));

      final either = await _kycRepository.uploadFiles(asFile: asFile, frontFile: frontFile, frontFileAsBytes: frontFileAsBytes, backFile:backFile, backFileAsBytes: backFileAsBytes);

      either.fold((l) {
        emit(state.copyWith(
            status: BlocStatus.uploadingIDFailed, message: l.errorDescription));
      }, (r) {
        emit(state.copyWith(
            status: BlocStatus.uploadingIDSuccessful
        ));
      });
    } catch (e) {
      emit(state.copyWith(
          status: BlocStatus.uploadingIDFailed, message: e.toString()));
    }
  }

}