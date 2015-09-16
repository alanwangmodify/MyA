//
//  CatalogViewController.m
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "CatalogViewController.h"

@interface CatalogViewController ()

@property (nonatomic,strong) UITableView *tableView;
@end

@implementation CatalogViewController
-(id)initWithCatalogModel:(CatalogModel *)catalogModel {
	self = [super init];
	if (self) {
		
		self.catalogModel = catalogModel;
		
	}
	return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableView.tableHeaderView = [[UIView alloc] init];
	[self UIinit];
}

-(void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	self.navigationController.navigationBarHidden = NO;
}
-(void)UIinit {
	
	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - StartY) style:UITableViewStyleGrouped];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	[self.view addSubview:_tableView];
	
}

#pragma mark ================ tableView delegte datasource ====================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.catalogModel.catalogs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdntifier = @"cellIdntifier";
	
	CatalogDetailModel *model  = self.catalogModel.catalogs[indexPath.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdntifier];
	if (cell == nil) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdntifier];
		
	}
	cell.textLabel.text  = model.catalog;
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
