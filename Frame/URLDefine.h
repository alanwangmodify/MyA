//
//  URLDefine.h
//  Frame
//
//  Created by choumei_mac on 15/1/23.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#ifndef Frame_URLDefine_h
#define Frame_URLDefine_h

//MARK:Host
#ifdef DEBUG
//测试连接
#define HostWeather @"http://v.juhe.cn/weather"  //天气查询
#define HostTestOnline @"http://apis.juhe.cn/exam" //在线试题
#define HostCarTest @"http://api2.juheapi.com/jztk" //驾照考试
#else
//正式链接
#define HostWeather @"http://v.juhe.cn/weather"  //天气查询
#define HostTestOnline @"http://apis.juhe.cn/exam" //在线试题
#define HostCarTest @"http://api2.juheapi.com/jztk/query" //驾照考试
#endif


//--------------------------------------------------------------------------------
//天气查询
#define Weather_Index @"index"

//在线试题
#define TestOnline_Catalog @"catalog"  //试题目录
#define TestOnline_Query @"query"

//驾照考试
#define CarTest_Query @"query"
#define CarTest_Answers @"answers"


//---------------------------------------------IDs-------------------------------------

//聚合链接ID
#define WeatherID @"39" //天气查询
#define TestOnlineID @"49"//在线试题
#define CarTestID @"183" //驾照
#endif