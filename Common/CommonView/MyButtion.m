//
//  MyButtion.m
//  Frame
//
//  Created by choumei_mac on 15/1/6.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyButtion.h"

@implementation MyButtion

-(instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		
		self.backgroundColor = [UIColor yellowColor];
		[self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		
		
	}
	return self;
}


@end
