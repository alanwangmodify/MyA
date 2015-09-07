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
static NSString *cellIdentifier = @"identifier";
@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.subjects = [[NSMutableArray alloc] init];
	
	[self getData];
	[self UIinit];
    
	
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

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    
	
}

#pragma mark  ----UICollectionViewDataSource,UICollectionViewDelegate


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


#pragma mark  =========other========

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
