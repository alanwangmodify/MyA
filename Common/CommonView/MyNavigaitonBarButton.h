//
//  MyNavigaitonBarButton.h
//  Frame
//
//  Created by choumei_mac on 15/1/12.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigaitonBarButton : UIView<UIGestureRecognizerDelegate>

@property (nonatomic,strong)NSString  *btnTitle;
@property (nonatomic,strong)NSString *imgName;

@property (nonatomic,assign)BOOL  isLeft;

@property (nonatomic,strong)MyLabel *titLabel;
@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,assign)CGRect frame;

@end
