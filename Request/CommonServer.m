//
//  CommonServer.m
//  Frame
//
//  Created by choumei_mac on 15/1/23.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "CommonServer.h"

@implementation CommonServer

////////prcticeDanlei
+ (id)sharedInstance
{
	static id SharedInstance = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if (SharedInstance == nil) {
			SharedInstance = [[self alloc] init];
		}
	});
	return SharedInstance;
}

-(void)juheGetUrl:(NSString *)url host:(NSString *)host loadingType:(NSUInteger)loadingtype parameter:(NSMutableDictionary *)dict apiID:(NSString *)apiID finishBlock:(serverFinishBlock)finishBlock failBlock:(serverFailBlock)failBlock {
	
	[[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH87a8576a751f8168c50b0c85a432d54f"];
	
	NSString *apiPath = [NSString stringWithFormat:@"%@/%@",host,url];
	NSMutableDictionary *paraDic = dict;
	[paraDic setObject:@"json" forKey:@"dtype"];
	JHAPISDK *juheApi = [JHAPISDK shareJHAPISDK];
	[juheApi executeWorkWithAPI:apiPath APIID:apiID Parameters:paraDic Method:@"GET" Success:^(id responseObject) {
		NSDictionary *rsponDic = (NSDictionary *)responseObject;
		MyLog(@"info : %@",rsponDic);
		finishBlock(rsponDic);
		
		
		
	} Failure:^(NSError *error) {
		
		failBlock([error localizedDescription]);
		
	}];
	
	
}

-(void)juhePostUrl:(NSString *)url host:(NSString *)host loadingType:(NSUInteger)loadingtype parameter:(NSMutableDictionary *)dict apiID:(NSString *)apiID finishBlock:(serverFinishBlock)finishBlock failBlock:(serverFailBlock)failBlock {
	
}

-(void)GetUrl:(NSString *)url host:(NSString *)host loadingType:(NSUInteger)loadingtype parameter:(NSMutableDictionary *)dict finishBlock:(serverFinishBlock)finishBlock failBlock:(serverFailBlock)failBlock {
	
}


-(void)PostUrl:(NSString *)url host:(NSString *)host loadingType:(NSUInteger)loadingtype parameter:(NSMutableDictionary *)dict finishBlock:(serverFinishBlock)finishBlock failBlock:(serverFailBlock)failBlock {
	
}
@end
