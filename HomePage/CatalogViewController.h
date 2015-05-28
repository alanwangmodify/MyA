//
//  CatalogViewController.h
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "ViewController.h"
#import "CatalogModel.h"
@interface CatalogViewController : ViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) CatalogModel *catalogModel;

-(id)initWithCatalogModel:(CatalogModel *)catalogModel;

@end
