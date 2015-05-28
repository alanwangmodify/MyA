//
//  MyFactory.h
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFactory : NSObject<NSCoding>

-(id)initWithDataDic:(NSDictionary *)dic;

-(void)setAttributes:(NSDictionary *)dateDic;


@end
