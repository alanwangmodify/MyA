//
//  QuestionTestViewController.h
//  Frame
//
//  Created by choumei on 15/9/8.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//

#import "ViewController.h"
#import "QuestionCell.h"

typedef NS_ENUM(NSInteger, questionTestType) {

    RandomTest,
    ListTest
    
};
@interface QuestionTestViewController : ViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *questions;
@property (nonatomic,strong) UITableView *tableView;


-(instancetype)initWithType:(questionTestType)type;

@end
