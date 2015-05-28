//
//  CommonRequest.m
//  Frame
//
//  Created by choumei_mac on 14/12/31.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "CommonRequest.h"

@implementation CommonRequest


-(id)initWithUrl:(NSString *)url host:(NSString *)host dict:(NSMutableDictionary *)dict loadingType:(NSInteger)loadingType {
	self = [super init];
	if (self) {
		
		_host = host;
		_url = url;
		_dic = dict;

		
		
	}
	return self;
	
}

-(id)initWithUrl:(NSString *)url host:(NSString *)host dict:(NSMutableDictionary *)dict loadingType:(NSInteger)loadingType APIID:(NSString*) apiId{
	self = [super init];
	if (self) {
		
		_host = host;
		_url = url;
		_apiID = apiId;
		_dic = dict;
		[[JHOpenidSupplier shareSupplier] registerJuheAPIByOpenId:@"JH87a8576a751f8168c50b0c85a432d54f"];

		
	}
	return self;
	
}

-(void)sendRequest  {
	
	//加载HUD
	
	
	//网络请求
	AFHTTPRequestOperationManager *httpRequest = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:_host]];
	//???
	httpRequest.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/css",@"text/plain", nil];
//	[httpRequest.requestSerializer setValue:[CMMommon appUserAgent] forHTTPHeaderField:@"User-Agent"];
	//
	AFHTTPRequestOperation *operation = [httpRequest GET:_url parameters:_dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		NSDictionary *finishDic = (NSDictionary *)responseObject;
		_finishCallBackInfo(finishDic);
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		
		
	}];
	MyLog(@"postUrl:%@",operation.request.URL);
	
}


-(void)postDataRequest {
	
	AFHTTPRequestOperationManager *operationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:_host]];
	AFHTTPRequestOperation *operation  = [operationManager POST:_url parameters:_dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
		
		
		
		
		
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		
		
	}];

	
}

-(void)starLoadView {
	
	
}
-(void)stopLoadView {
	
	
}


-(void)juheRequestGetJson{
	
	
	NSMutableDictionary *dict = _dic;
	[dict setObject:@"json" forKey:@"dtype"];
	
	
	
	
	
	
	
}






@end
