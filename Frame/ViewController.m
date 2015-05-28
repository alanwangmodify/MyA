//
//  ViewController.m
//  Frame
//
//  Created by choumei_mac on 14/12/28.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor  =[UIColor whiteColor];
	
	if(IS_OS_7_OR_LATER)
	{
		self.edgesForExtendedLayout = UIRectEdgeNone;
		self.extendedLayoutIncludesOpaqueBars  = YES;
		self.automaticallyAdjustsScrollViewInsets = NO;
		
	}
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
