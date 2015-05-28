//
//  CMSelectActionSheet.m
//  Hair Design
//
//  Created by Admin on 14-7-24.
//  Copyright (c) 2014年 xiaokang. All rights reserved.
//

#import "CMSelectActionSheet.h"

@implementation CMSelectActionSheet
- (id)initWithFrame:(CGRect)frame
      backGroundImg:(NSArray *)backGroudArr
backGroundSlectedImg:(NSArray *)backGroudSelectedArr
              title:(NSArray *)titleArr
         seletIndex:(DidClickOnIndex)didClickOnIndex
{
    self = [super initWithFrame:frame];
    if (self)
	{
		//

		self.backgroundColor = UIColorFromRGB(0xffffff);
        _didClickOnIndex = didClickOnIndex;
        for (int i = 0; i < backGroudArr.count; i ++) {
            UIImage *backImg = [[UIImage imageNamed:[backGroudArr objectAtIndex:i]] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
            UIImage *backSelectImg = [[UIImage imageNamed:[backGroudSelectedArr objectAtIndex:i]] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
            NSString *strTitle=[titleArr objectAtIndex:i];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.tag = i;
            [btn setBackgroundImage:backImg forState:UIControlStateNormal];
            [btn setBackgroundImage:backSelectImg forState:UIControlStateHighlighted];
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:21];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitle:strTitle forState:UIControlStateNormal];
            btn.frame = CGRectMake(16, (10 + 50)*i + 24, SCREEN_WIDTH-32, 50);
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
    }
    return self;
}

- (void)btnClicked:(UIButton *)sender{
    _didClickOnIndex(sender.tag);
    [self slideOutTo:kFTAnimationBottom duration:0.2 delegate:nil];
    [self closePopup];
    
}


@end
