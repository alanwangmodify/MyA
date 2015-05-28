//
//  URLDefine.h
//  Frame
//
//  Created by choumei_mac on 15/1/23.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#ifndef Frame_URLDefine_h
#define Frame_URLDefine_h


#ifdef DEBUG
//测试连接

#define HostWeather @"http://v.juhe.cn/weather"  //天气查询
#define HostTestOnline @"http://apis.juhe.cn/exam" //在线试题

#else
//正式链接
#endif


#define HostWeather @"http://v.juhe.cn/weather"  //天气查询
#define HostTestOnline @"http://apis.juhe.cn/exam" //在线试题




#endif

//天气查询
#define Index @"index"

//在线试题
#define Catalog @"catalog"  //试题目录
#define Query @"query"


//聚合链接ID
#define WeatherID @"39" //天气查询
#define TestOnlineID @"49"//在线试题