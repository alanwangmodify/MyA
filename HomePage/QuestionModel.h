//
//  QuestionModel.h
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyFactory.h"


@interface QuestionModel : MyFactory
@property (nonatomic,strong) NSString *questionId;
@property (nonatomic,strong) NSString *question;
@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *item1;
@property (nonatomic,strong) NSString *item2;
@property (nonatomic,strong) NSString *item3;
@property (nonatomic,strong) NSString *item4;
@property (nonatomic,strong) NSString *explains;
@property (nonatomic,strong) NSString *url;
@end
