import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:paperless_listings/core/network/api_config.dart';
import 'package:paperless_listings/core/network/api_error.dart';
import 'package:paperless_listings/core/network/network_provider.dart';
import 'package:paperless_listings/core/utils/constants.dart';
import 'package:paperless_listings/core/utils/injector.dart';

class KYCRepository {

  final networkProvider = sl<NetworkProvider>();

  Future<Either<ApiError, dynamic>> uploadFiles({required bool asFile, File? frontFile, Uint8List? frontFileAsBytes, File? backFile, Uint8List? backFileAsBytes}) async {
    try{

      const path = "https://api.cloudinary.com/v1_1/paperless/image/upload";

      Map<String,dynamic> uploadData = {
        "upload_preset": 'ix8u70vl',
        // "file": [
        //   asFile ? await MultipartFile.fromFile(frontFile!.path) :  MultipartFile.fromBytes(frontFileAsBytes!),
        //   asFile ? await MultipartFile.fromFile(backFile!.path) :  MultipartFile.fromBytes(backFileAsBytes!),
        // ],
        "file": asFile ? await MultipartFile.fromFile(frontFile!.path) :  MultipartFile.fromBytes(frontFileAsBytes!)
      };

      FormData formData = FormData.fromMap(uploadData);

      var response = await networkProvider.call(
          path: path,
          method: RequestMethod.post,
          body: formData
      );

      if(response!.statusCode == 200){

        return Right(response.data);

      }else {

        return Left(ApiError(errorDescription: kDefaultErrorText));

      }


    }catch(e){
      return Left(ApiError(errorDescription: e.toString()));
    }


  }
}