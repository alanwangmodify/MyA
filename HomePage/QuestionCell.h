//
//  QuestionCell.h
//  Frame
//
//  Created by choumei on 15/9/15.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
typedef void (^QuestionIdBlock)(NSString * QuestionId);

@interface QuestionCell : UITableViewCell

@property (nonatomic,strong) UILabel *IDNumLab;
@property (nonatomic,strong) UILabel *answerLab1;
@property (nonatomic,strong) UILabel *answerLab2;
@property (nonatomic,strong) UILabel *answerLab3;
@property (nonatomic,strong) UILabel *answerLab4;
@property (nonatomic,strong) UIView *whiteBgView;
@property (nonatomic,strong) UITextView *questionTextView;
@property (nonatomic,strong) UIImageView *questionView;
@property (nonatomic,assign) QuestionIdBlock quesitonId;

-(void)getDataFromModel:(QuestionModel *)model ;


@end
