//
//  CatalogModel.m
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "CatalogModel.h"

@implementation CatalogModel



-(void)setArrayWithArray:(NSArray *)arr {
	
	NSMutableArray *tempArr = [[NSMutableArray alloc] init];
	for (NSDictionary *dic in arr) {
		CatalogDetailModel *model = [[CatalogDetailModel alloc] initWithDataDic:dic];
		[tempArr addObject:model];
	}
	_catalogs = tempArr;
	
	
}
@end

@implementation CatalogDetailModel



@end