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
	
	ViolationViewController *Violation = [[ViolationViewController alloc] init];
	Violation.hidesBottomBarWhenPushed = YES ;
	Violation.title = @"违章";
    
    OilViewController *oilVC = [[OilViewController alloc] init];
    oilVC.hidesBottomBarWhenPushed = YES ;
    oilVC.title = @"加油";
    
    CarViewController *carVC = [[CarViewController alloc] init];
    carVC.hidesBottomBarWhenPushed = YES ;
    carVC.title = @"车辆";
	
	UINavigationController *homePageNC = [[UINavigationController alloc] initWithRootViewController:homePage];
	UINavigationController *ViolationNC = [[UINavigationController alloc] initWithRootViewController:Violation];
    UINavigationController *oilNC = [[UINavigationController alloc] initWithRootViewController:oilVC];
    UINavigationController *carNC = [[UINavigationController alloc] initWithRootViewController:carVC];
	
	NSArray *vcs = @[homePageNC,ViolationNC,oilNC,carNC];
	self.viewControllers = vcs;	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
