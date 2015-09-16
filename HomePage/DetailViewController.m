//
//  DetailViewController.m
//  Frame
//
//  Created by choumei_mac on 15/1/12.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController


-(void)viewWillAppear:(BOOL)animated {
	
	[super viewWillAppear:animated];
	self.navigationController.navigationBarHidden = NO;
}
-(void)viewDidLoad {
	[super viewDidLoad];
	
	MyNavigaitonBarButton *barBtn = [[MyNavigaitonBarButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:barBtn];
	
}
@end
