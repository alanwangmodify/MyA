//
//  CatalogModel.h
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyFactory.h"

@interface CatalogDetailModel : MyFactory

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *catalog;


@end


@interface CatalogModel : NSObject

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSArray *catalogs;



-(void)setArrayWithArray:(NSArray *)arr;


@end
