//
//  CommonServer.h
//  Frame
//
//  Created by choumei_mac on 15/1/23.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^serverFinishBlock)(NSDictionary *info);
typedef void (^serverFailBlock)(NSString *info);

@interface CommonServer : NSObject
+ (id)sharedInstance;
//
-(void)juheGetUrl:(NSString *)url
			 host:(NSString *)host
	  loadingType:(NSUInteger)loadingtype
		parameter:(NSMutableDictionary *)dict
			apiID:(NSString*)apiID
	  finishBlock:(serverFinishBlock)finishBlock
		failBlock:(serverFailBlock)failBlock;

-(void)juhePostUrl:(NSString *)url
			  host:(NSString *)host
	   loadingType:(NSUInteger)loadingtype
		 parameter:(NSMutableDictionary *)dict
			 apiID:(NSString*)apiID
	   finishBlock:(serverFinishBlock)finishBlock
		 failBlock:(serverFailBlock)failBlock;
//

-(void)GetUrl:(NSString *)url
			 host:(NSString *)host
	  loadingType:(NSUInteger)loadingtype
		parameter:(NSMutableDictionary *)dict
	  finishBlock:(serverFinishBlock)finishBlock
		failBlock:(serverFailBlock)failBlock;

-(void)PostUrl:(NSString *)url
			  host:(NSString *)host
	   loadingType:(NSUInteger)loadingtype
		 parameter:(NSMutableDictionary *)dict
	   finishBlock:(serverFinishBlock)finishBlock
		 failBlock:(serverFailBlock)failBlock;



@end
