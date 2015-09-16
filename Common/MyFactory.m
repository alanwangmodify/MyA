//
//  MyFactory.m
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyFactory.h"

@implementation MyFactory


-(id)initWithDataDic:(NSDictionary *)dic {
	if (self = [super init]) {
		[self setAttributes:dic];
		
	}
	return self;
	
}

-(void)setAttributes:(NSDictionary *)dataDic {
	
	//first way
	NSDictionary *attrMapDic = [self attributeMapDictionary];
	//如果为空，建立映射关系
	if (attrMapDic == nil) {
		
		NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
		for (NSString *key in dataDic) {
			[dic setValue:key forKey:key];
			attrMapDic = dic;
		}
	}
	
	NSEnumerator *keyEnum = [attrMapDic keyEnumerator];  //学习一下枚举器
	id attributeName;
	while ((attributeName = [keyEnum nextObject])) {
		SEL sel = [self getSetterSelWithAttibuteName:attributeName];
		
		if ([self respondsToSelector:sel]) { //响应时调用
			
			NSString *dataDicKey = [attrMapDic objectForKey:attributeName];
			id attributeValue = [dataDic objectForKey:dataDicKey];
			
			if ([[dataDic objectForKey:dataDicKey] isKindOfClass:[NSNull class]]) {
				MyLog(@"key %@ is null",dataDicKey);
				attributeValue = @"";
			}
			
			[self performSelectorOnMainThread:sel
								   withObject:attributeValue
								waitUntilDone:[NSThread isMainThread]];
		}

		
	}
	
	
	
//	//second way --
//	NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:[dataDic count]];
//	
//	for (NSString *key in dataDic) {
//		//赋值
//		[self setValue:[dataDic objectForKey:key] forKey:key];
//		
//	}
	
	
}
-(NSDictionary*)attributeMapDictionary{
	return nil;
}

-(SEL)getSetterSelWithAttibuteName:(NSString*)attributeName{
	NSString *capital = [[attributeName substringToIndex:1] uppercaseString];
	NSString *setterSelStr = [NSString stringWithFormat:@"set%@%@:",capital,[attributeName substringFromIndex:1]];
	return NSSelectorFromString(setterSelStr);
}
//归档
-(id)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		
        
        
	}
	return self;
	
	
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
	
	
	
	
}
@end
