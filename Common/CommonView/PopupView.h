//
//  PopupView.h
//  Lagou
//
//  Created by xiaokang-iMac on 14-4-1.
//  Copyright (c) 2014年 bis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTAnimation.h"// 动画相关

@class PopupView;

@protocol PopupContentViewDelegate <NSObject>

// 在Window中时显示的大小
//- (CGSize)contentSize;

@required

- (void)setPopupParent:(PopupView *)popup;

- (CGRect)showRect;

- (void)closePopup;

// YES：击返回空的区域
- (BOOL)isAlert;

// 点击空白区域
- (void)onTouchBlank;
@end



@interface PopupContentView : UIView<PopupContentViewDelegate>

@property (nonatomic, assign) PopupView *popupParent;
@property (nonatomic, assign) CGRect showRect;
@property (nonatomic, assign) BOOL isAlert;

@end



typedef enum
{
	/** Opacity animation */
	EPopupViewAnimationFade,
	/** Opacity + scale animation */
	EPopupViewAnimationZoom,
	EPopupViewAnimationZoomOut = EPopupViewAnimationZoom,
	EPopupViewAnimationZoomIn
}PopupViewAnimation;

@interface PopupView : UIView<UIGestureRecognizerDelegate>

@property (assign) BOOL dimBackground;
@property (assign) PopupViewAnimation animationType;
@property (nonatomic, readonly) UIView<PopupContentViewDelegate> *contentView;

+ (PopupView *)alertInWindow:(PopupContentView *)contentView;

+ (PopupView *)alertInWindow:(PopupContentView *)contentView withAnimation:(void (^)(void))animation;

+ (PopupView *)alert:(PopupContentView *)contentView inView:(UIView *)view;

+ (PopupView *)alert:(PopupContentView *)contentView inView:(UIView *)view withAnimation:(void (^)(void))animation;

+ (PopupView *)tipInWindow:(PopupContentView *)contentView;

+ (PopupView *)tip:(PopupContentView *)contentView inView:(UIView *)view;

- (void)show:(BOOL)animated;

- (void)showWith:(void (^)(void))animation;

- (void)hide:(BOOL)animated;

@end








