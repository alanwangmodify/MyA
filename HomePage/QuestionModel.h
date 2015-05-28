//
//  QuestionModel.h
//  Frame
//
//  Created by choumei_mac on 15/1/26.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "MyFactory.h"

@interface QuestionDataModel : MyFactory

@property (nonatomic,strong) NSString *id;
@property (nonatomic,strong) NSString *subjectName;
@property (nonatomic,strong) NSString *knowledge;
@property (nonatomic,strong) NSString *sourcename;
@property (nonatomic,strong) NSString *questionTypes;
@property (nonatomic,strong) NSString *questionDifficulty;
@property (nonatomic,strong) NSString *question;
@property (nonatomic,strong) NSString *answer;
@property (nonatomic,strong) NSString *resolve;

@end

@interface QuestionModel : MyFactory

@end
