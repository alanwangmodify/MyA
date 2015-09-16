//
//  QuestionCell.m
//  Frame
//
//  Created by choumei on 15/9/15.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "QuestionCell.h"

@implementation QuestionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        _whiteBgView = [[UIView alloc] init];
        _whiteBgView.backgroundColor = [UIColor clearColor];

#warning GetPoint
        _whiteBgView.transform = CGAffineTransformRotate(_whiteBgView.transform, M_PI_2);//这里也翻转
        _whiteBgView.frame = CGRectMake(0, 0 , SCREEN_HEIGHT , SCREEN_WIDTH );
        _whiteBgView.layer.masksToBounds = YES;
        _whiteBgView.layer.cornerRadius = 10.0f;
        [self.contentView addSubview:_whiteBgView];
        
        
        UIView *colorView = [[UIView alloc] init];
        colorView.frame = CGRectMake(10, 20 , SCREEN_WIDTH  - 20, SCREEN_HEIGHT- StartY - 40);
        colorView.backgroundColor = [UIColor whiteColor];
        colorView.layer.masksToBounds = YES;
        colorView.layer.cornerRadius = 10.0;
        [_whiteBgView addSubview:colorView];
        
        _IDNumLab = [[UILabel alloc] init];
        _IDNumLab.frame = CGRectMake(10, 10,100, 20);
        _IDNumLab.textColor = [UIColor blackColor];
        [colorView addSubview:_IDNumLab];
        
        _questionTextView = [[UITextView alloc] init];
        _questionTextView.frame = CGRectMake(10, 30, SCREEN_WIDTH - 20, 70);
        _questionTextView.text = @"测试测试";
        _questionTextView.backgroundColor = [UIColor clearColor];
        _questionTextView.editable = NO;
        _questionTextView.textColor  = [UIColor blackColor];
        _questionTextView.font = [UIFont systemFontOfSize:13.0f];
        [colorView addSubview:_questionTextView];
        
        _questionView = [[UIImageView alloc] init];
        _questionView.backgroundColor = [UIColor redColor];
        _questionView.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_questionView.frame) + 5, 100, 100);
        _questionView.backgroundColor = [UIColor grayColor];
        [colorView addSubview:_questionView];
        
        _answerLab1 = [[UILabel alloc] init];
        _answerLab1.textColor = [UIColor blackColor];
        _answerLab1.font = [UIFont systemFontOfSize:13.0f];
        [colorView addSubview:_answerLab1];
        
        _answerLab2 = [[UILabel alloc] init];
        _answerLab2.textColor = [UIColor blackColor];
        _answerLab2.font = [UIFont systemFontOfSize:13.0f];
        [colorView addSubview:_answerLab2];
        
        
        _answerLab3 = [[UILabel alloc] init];
        _answerLab3.textColor = [UIColor blackColor];
        _answerLab3.font = [UIFont systemFontOfSize:13.0f];
        [colorView addSubview:_answerLab3];
        
        
        _answerLab4 = [[UILabel alloc] init];
        _answerLab4.textColor = [UIColor blackColor];
        _answerLab4.font = [UIFont systemFontOfSize:13.0f];
        [colorView addSubview:_answerLab4];
        
    }
    return self;
    
}

-(void)getDataFromModel:(QuestionModel *)model {
    if (!model) {
        return;
    }
    
    _IDNumLab.text = [NSString stringWithFormat:@"题目:%@",model.questionId];
    _questionTextView.text = model.question;
    _answerLab1.text = [NSString stringWithFormat:@"A.%@",model.item1];
    _answerLab2.text = [NSString stringWithFormat:@"B.%@",model.item2];
    _answerLab3.text = [NSString stringWithFormat:@"C.%@",model.item3];
    _answerLab4.text = [NSString stringWithFormat:@"D.%@",model.item4];
    
    [_questionView sd_setImageWithURL:[NSURL URLWithString:model.url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _questionView.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_questionTextView.frame) + 5, _questionView.image.size.width, _questionView.image.size.height);
        CGSize maxSize = CGSizeMake(SCREEN_WIDTH - 40, 1000);
        
        //A
        CGSize size =model.item1.length > 0 ? [model.item1 boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]} context:nil].size : CGSizeZero;
        _answerLab1.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_questionView.frame) + 11, SCREEN_WIDTH - 40, size.height);
        
        //B
        size =model.item2.length > 0 ? [model.item2 boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]} context:nil].size : CGSizeZero;
        _answerLab2.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_answerLab1.frame) + 10, SCREEN_WIDTH - 40, size.height);
        
        //C
        size =model.item3.length > 0 ? [model.item3 boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]} context:nil].size : CGSizeZero;
        _answerLab3.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_answerLab2.frame) + 10, SCREEN_WIDTH - 40, size.height);
        
#warning GetPoint
        //D
        size =model.item4.length > 0 ? [model.item4 boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]} context:nil].size : CGSizeZero;
        _answerLab4.frame = CGRectMake(CGRectGetMinX(_questionTextView.frame), CGRectGetMaxY(_answerLab3.frame) + 10, SCREEN_WIDTH - 40, size.height);
    }];
    
    
}


- (void)awakeFromNib {
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
