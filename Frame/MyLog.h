//
//  MyLog.h
//  Frame
//
//  Created by choumei_mac on 15/1/9.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#ifndef Frame_MyLog_h
#define Frame_MyLog_h


#ifdef DEBUG

#define MyLog(fmt, ...) NSLog((@"[%s Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)

#else

#define MyLog(...)

#endif


#endif
