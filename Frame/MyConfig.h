//
//  MyConfig.h
//  Frame
//
//  Created by choumei_mac on 14/12/28.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#ifndef Frame_MyConfig_h
#define Frame_MyConfig_h


#define JUHEWEATHERAPPKEY @"c121995c85ab771b9f67b176c320da42"   //天气预报
#define JUHEONLINETESTAPPKEY @"232635816e65ce23987451b2f5f9b4d6"  //在线试题
#define JUHEONLCarBookAPPKEY @"33c4a357b63fa6c13ad7593a8a2cf58c"  //驾照考试



#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏宽
#define StartY (44 + (IS_OS_7_OR_LATER ? 20 : 0))


//颜色规范
#define MyBackColor UIColorFromRGB(0xf3eeec)
#define MyThemeColor UIColorFromRGB(0xe83260)  //字体粉色
#define MyLineColor UIColorFromRGB(0xdadada)   //分割线
#define MyTitleWordColor UIColorFromRGB(0x313131) //标题栏字体颜色
#define MyWordDeepColor UIColorFromRGB(0x2c2c2c)//字体深色
#define MyWordGrayColor UIColorFromRGB(0xaaaaaa) //字体灰色
#define MyWordPinkColor UIColorFromRGB(0xe83260)  //字体粉色
#define MyWordYellowColor UIColorFromRGB(0xfff329) //字体黄色
#define MyWordNotUseColor UIColorFromRGB(0xc8c8c8) //字体禁用颜色

#define MyNavTitleColor UIColorFromRGB(0xffd200) //导航栏黄色字体
#define MyNavBGCOLOR RGBCOLOR(43, 43, 54)


//字体大小规范
#define MyBIGFONT_SPECIAL [UIFont systemFontOfSize:21.0]
#define MyBIGFONT [UIFont systemFontOfSize:17.0]
#define MyMEDIUMFONT [UIFont systemFontOfSize:15.0]
#define MySMALLFONT [UIFont systemFontOfSize:12.0]
#define MySMALLFONT_SPECIAL [UIFont systemFontOfSize:10.0]

//NSUserDefaults Keys
#define CarTestInfoKey @"CarTestInfo"
#define ReadQuestionIdKey @"ReadQuestionIdKey"
#endif

