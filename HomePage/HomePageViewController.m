//
//  HomePageViewController.m
//  Frame
//
//  Created by choumei_mac on 14/12/30.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@property (nonatomic,strong) NSMutableArray *subjects;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//	ModelSwift *model = [[ModelSwift alloc] init];
//	model.nameTest = @"dd";
//	[model mainTest:@"ddd"];
	
	self.subjects = [[NSMutableArray alloc] init];
	
	[self getData];
	[self UIinit];
	
	
	
//	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//	[dic setObject:@"上海" forKey:@"cityname"];
//	[dic setObject:JUHEWEATHERAPPKEY forKey:@"key"];
//
//	[[CommonServer sharedInstance] juheGetUrl:Index
//										 host:HostWeather
//								  loadingType:LoadingTypeNone
//									parameter:dic
//										apiID:@"39"
//								  finishBlock:^(NSDictionary *info) {
//									  
//								  } failBlock:^(NSDictionary *info) {
//									  
//								  }];
	
//
//	
//	UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 80, 25)];
//	[btn setBackgroundColor:[UIColor yellowColor]];
//	[btn setTitle:@"导航" forState:UIControlStateNormal];
//	[btn addTarget:self action:@selector(starGuide) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:btn];
//	
//	MyButtion *btnNext = [[MyButtion alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 80 -20, 100, 80, 25)];
//	[btnNext setTitle:@"下一界面" forState:UIControlStateNormal];
//	[btnNext setBackgroundColor:[UIColor yellowColor]];
//	[btnNext addTarget:self action:@selector(nextVC) forControlEvents:UIControlEventTouchUpInside];
//	[self.view addSubview:btnNext];
	
}


-(void)getData{
	
	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
	[dic setValue:JUHEONLINETESTAPPKEY forKey:@"key"];
	
	[[CommonServer sharedInstance] juheGetUrl:Catalog
										 host:HostTestOnline
								  loadingType:LoadingTypeNone
									parameter:dic
										apiID:TestOnlineID
								  finishBlock:^(NSDictionary *info) {
									  
									  if ([[info objectForKey:@"reason"] isEqualToString:@"success"])  {
										  NSDictionary *resultDic = [info objectForKey:@"result"];
										  
										  for (NSString *key in resultDic) {
											  
											  CatalogModel *model = [[CatalogModel alloc] init];
											  model.title = key;
											  [model setArrayWithArray:[resultDic objectForKey:key]];
											  [self.subjects addObject:model];
										  }
										  
									  }
									  [self.tableView reloadData];
									  
								  } failBlock:^(NSString *info) {
									  
								  }];
}
-(void)UIinit {
	
	_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - StartY-44) style:UITableViewStylePlain];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	[self.view addSubview:_tableView];
	
}


-(void)nextVC  {

	
	
}


#pragma mark ================ tableView delegte datasource ====================
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.subjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdntifier = @"cellIdntifier";
	
	CatalogModel *model  = self.subjects[indexPath.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdntifier];
	if (cell == nil) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdntifier];
		
	}
	cell.textLabel.text  = model.title;
	return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	CatalogModel *model  = self.subjects[indexPath.row];
	CatalogViewController *vc = [[CatalogViewController alloc] initWithCatalogModel:model];
	[self.rdv_tabBarController.navigationController pushViewController:vc animated:YES];

	
}

#pragma mark  =========other========
-(void)starGuide {
	
	if (![CLLocationManager locationServicesEnabled]){
		UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请在系统设置中打开“定位服务”来允许“臭美美发”确定您的位置" delegate:nil cancelButtonTitle:@"确定 " otherButtonTitles: nil];
		[alertView show];
		return;
	}
	
	
	if ([[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"baidumap://map/"]]){
		NSString *urlString = [[NSString stringWithFormat:@"baidumap://map/direction?origin=我的位置&destination=latlng:%f,%f|终点&mode=driving",11.5 ,12.6] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		
		[[UIApplication sharedApplication]openURL:[NSURL URLWithString:urlString]];
	}else{
		
	}

}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
