//
//  TabBarViewController.m
//  Frame
//
//  Created by choumei_mac on 14/12/29.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "TabBarViewController.h"


@implementation UINavigationBar (CustomBackground)

- (void)didMoveToSuperview
{
	if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
	{
		if (IS_OS_7_OR_LATER) {
			[self setBackgroundImage:[UIImage imageNamed:@"choumei_nav_i7"] forBarMetrics:UIBarMetricsDefault];
		}else{
			[self setBackgroundImage:[UIImage imageNamed:@"choumei_nav"] forBarMetrics:UIBarMetricsDefault];
		}

		[self setBackgroundColor:[UIColor yellowColor]];

	}
}

- (void)drawRect:(CGRect)rect
{
	[self setBackgroundColor:[UIColor yellowColor]];
	if (IS_OS_7_OR_LATER) {
		[self setBackgroundImage:[UIImage imageNamed:@"choumei_nav_i7"] forBarMetrics:UIBarMetricsDefault];
	}else{
		[self setBackgroundImage:[UIImage imageNamed:@"choumei_nav"] forBarMetrics:UIBarMetricsDefault];
	}
	
}

@end

@interface TabBarViewController ()

@end

@implementation TabBarViewController
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	HomePageViewController *homePage = [[HomePageViewController alloc] init];
	homePage.hidesBottomBarWhenPushed = YES ;
	homePage.title = @"首页";
	
	HomePageViewController *homePage2 = [[HomePageViewController alloc] init];
	homePage2.hidesBottomBarWhenPushed = YES ;
	homePage2.title = @"第二页";
	
	UINavigationController *homePageNC = [[UINavigationController alloc] initWithRootViewController:homePage];
	UINavigationController *homePage2NC = [[UINavigationController alloc] initWithRootViewController:homePage2];
	
	NSArray *vcs = @[homePageNC,homePage2NC];
	self.viewControllers = vcs;	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
