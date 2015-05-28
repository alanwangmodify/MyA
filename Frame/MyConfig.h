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


#define IS_OS_7_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)//屏高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)//屏宽
#define StartY (44 + (IS_OS_7_OR_LATER ? 20 : 0))


#endif

