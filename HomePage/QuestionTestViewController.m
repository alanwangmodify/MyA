//
//  QuestionTestViewController.m
//  Frame
//
//  Created by choumei on 15/9/8.
//  Copyright (c) 2015年 choumei_mac. All rights reserved.
//


//
//{
//    "error_code": 0,
//    "reason": "ok",
//    "result": [
//               {
//                   "id": 12,
//                   "question": "这个标志是何含义？",//问题
//                   "answer": "4",//答案
//                   "item1": "前方40米减速",//选项，当内容为空时表示判断题正确选项
//                   "item2": "最低时速40公里",//选项，当内容为空时表示判断题错误选项
//                   "item3": "限制40吨轴重",
//                   "item4": "限制最高时速40公里",
//                   "explains": "限制最高时速40公里：表示该标志至前方限制速度标志的路段内，机动车行驶速度不得超过标志所示数值。此标志设在需要限制车辆速度的路段的起点。以图为例：限制行驶时速不得超过40公里。",//答案解释
//                   "url": "http://images.juheapi.com/jztk/c1c2subject1/12.jpg"//图片url
//               }
//               ]
//}
#import "QuestionTestViewController.h"

@interface QuestionTestViewController ()
{
    questionTestType _type;
}
@end

@implementation QuestionTestViewController


-(instancetype)initWithType:(questionTestType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
    
}

#pragma mark life CirlCle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _questions = [[NSMutableArray alloc] init];
    self.view.backgroundColor = MyBackColor;
    
    [self UIinit];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:CarTestInfoKey]) {
        [self getLocalData];
    }else {
        [self getQuetionsData];
    }
    
    
}
#pragma mark Views
-(void)UIinit {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, StartY, SCREEN_HEIGHT, SCREEN_WIDTH) style:UITableViewStyleGrouped];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.backgroundColor = MyBackColor;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.transform = CGAffineTransformRotate(_tableView.transform, -M_PI_2);
    _tableView.frame = self.view.bounds;
    _tableView.pagingEnabled = YES;
    
}


#pragma mark Actions
- (void)getLocalData {
    //
    NSDictionary *info  = [[NSUserDefaults standardUserDefaults] objectForKey:CarTestInfoKey];
    //成功
    NSArray *result = info[@"result"];
    for (NSDictionary *dict in result) {
        
        QuestionModel *model = [[QuestionModel alloc]initWithDataDic:dict];
        
        model.questionId = [dict objectForKey:@"id"];
        [_questions addObject:model];
    }
    [self.tableView reloadData];
}


#pragma mark 网络请求
//问题
-(void)getQuetionsData{
//    
//    名称	类型	必填	说明
//    key	string	是	您申请的appKey
//    subject	int	是	选择考试科目类型，1：科目1；4：科目4
//    model	string	是	驾照类型，可选择参数为：c1,c2,a1,a2,b1,b2；当subject=4时可省略
//    testType	string	否	测试类型，rand：随机测试（随机100个题目），order：顺序测试（所选科目全部题目）
    
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:JUHEONLCarBookAPPKEY forKey:@"key"];
    [dic setObject:@"1" forKey:@"subject"];
    [dic setObject:@"c1" forKey:@"model"];
    [dic setObject:@"order" forKey:@"testType"];
    
    [[CommonServer sharedInstance] juheGetUrl:CarTest_Query
                                         host:HostCarTest
                                  loadingType:LoadingTypeProgressView
                                    parameter:dic
                                        apiID:CarTestID
                                  finishBlock:^(NSDictionary *info) {
                                      NSString *reason = info[@"reason"];
                                      
                                      [[NSUserDefaults standardUserDefaults] setObject:info forKey:CarTestInfoKey];
                                      
                                      //成功
                                      if ([reason isEqualToString:@"ok"]) {
                                          
                                          NSArray *result = info[@"result"];
                                          for (NSDictionary *dict in result) {
                                              
                                              QuestionModel *model = [[QuestionModel alloc]initWithDataDic:dict];
                                              model.questionId = [dict objectForKey:@"id"];
                                              [_questions addObject:model];
                                          }
                                          [self.tableView reloadData];
                                          
                                      }
                                      //失败
                                      
                                  } failBlock:^(NSString *info) {
                                     
                                      
                                  }];


}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _questions.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return SCREEN_WIDTH ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0001;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.0001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell ) {
        cell = [[QuestionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    QuestionModel *model = _questions[indexPath.section];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell getDataFromModel:model];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
