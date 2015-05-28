//
//  CommonRequest.h
//  Frame
//
//  Created by choumei_mac on 14/12/31.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LoadingType) {
	LoadingTypeNone,
	LoadingTypeLoadView,
	LoadingTypeProgressView,
};


typedef void (^requestFailCallback)(NSDictionary *failCallBackDic);
typedef void (^requestFinishCallback)(NSDictionary *finshCallBackInfoDic);

@interface CommonRequest : NSObject

@property (nonatomic, copy) requestFinishCallback finishCallBackInfo;
@property (nonatomic, copy) requestFailCallback failCallBackDic;

@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSString *apiID;




- (id)initWithUrl:(NSString *)url host:(NSString *)host dict:(NSMutableDictionary *)dict loadingType:(NSInteger)loadingType;
- (void)sendRequest;
- (void)postDataRequest;
- (AFHTTPRequestOperationManager *)httpRequestMananger;

-(void)juheRequest;

@end
