//
//  CMSelectActionSheet.h
//  Hair Design
//
//  Created by Admin on 14-7-24.
//  Copyright (c) 2014年 xiaokang. All rights reserved.
//

#import "PopupView.h"

@interface CMSelectActionSheet : PopupContentView

typedef void (^DidClickOnIndex)(NSInteger index);

@property (nonatomic, copy) DidClickOnIndex didClickOnIndex;

- (id)initWithFrame:(CGRect)frame
      backGroundImg:(NSArray *)backGroudArr
backGroundSlectedImg:(NSArray *)backGroudSelectedArr
              title:(NSArray *)titleArr
         seletIndex:(DidClickOnIndex)didClickOnIndex;

@end
