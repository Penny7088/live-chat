import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:live_chat/app/model/country_entity.dart';
import 'package:live_chat/base/utils/extensions/widget_extensions.dart';
import 'package:live_chat/base/utils/text_styles.dart';

class CountryItemView extends StatelessWidget{

  final Countries countries;


  const CountryItemView({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: (1.sw -40.w),
      height: 60,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(countries.flagIcon ?? '', width: 40.w, height: 40.w).cornerRadiusWithClipRRect(10),
          14.horizontalSpace,
          Text(
            '${countries.name}',
            style: boldTextStyle(),
          )
        ],
      ),
    );

  }

}