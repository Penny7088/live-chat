
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

assetImage({required String url,double? width,double? height,BoxFit? fit = BoxFit.cover}){
  return Image.asset(url,width: width,height: height,fit: fit);
}

commonText({required String text,TextStyle? style}){
  return Text(text.tr,style: style);
}