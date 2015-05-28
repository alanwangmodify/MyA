//
//  MyNavigaitonBarButton.m
//  Frame
//
//  Created by choumei_mac on 15/1/12.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyNavigaitonBarButton.h"

@implementation MyNavigaitonBarButton


-(instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		_frame = frame;
		[self UIInit];
	}
	return self;
}
-(instancetype)initWithTitle:(NSString *)title Image:(NSString *)imageName {
	
	self = [super init];
	if (self) {
		_imgName = imageName ;
		_btnTitle = title;
//		[self UIInit];
	}
	return self;
	
}
-(instancetype)init {
	self = [super init];
	if (self){
		
		
//		[self UIInit];
	}
	return self;
	
}

-(void)UIInit {
	
	if (!_imgName) {
		
	}

	_imgName = @"backButtonImg";
	UIImage *image = [UIImage imageNamed:_imgName];
	_imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 20, image.size.width,_frame.size.height)];
	[self addSubview:_imageView];
	
	_titLabel = [[MyLabel alloc] init];
	_titLabel.text = @"标题";
	[self addSubview:_titLabel];

	_titLabel.frame = CGRectMake(60, 20, 40, 40);
	
	
	
	
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	MyLog(@"touchBegan");
	
	self.alpha = 0.3;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

	self.alpha = 1;
	MyLog(@"touchEnd");
}

-(void)tapAction {
	
}

@end
