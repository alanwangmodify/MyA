//
//  HomePageViewController.m
//  Frame
//
//  Created by choumei_mac on 14/12/30.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@property (nonatomic,strong) NSMutableArray *subjects;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *continueView;
@property (nonatomic,strong) UIButton *continueBtn;
@property (nonatomic,strong) UIButton *reStartBtn;
@property (nonatomic,strong) CABasicAnimation *btnAnimation;

@end
static NSString *cellIdentifier = @"identifier";
@implementation HomePageViewController

//key	string	是	您申请的appKey
//subject	int	是	选择考试科目类型，1：科目1；4：科目4
//model	string	是	驾照类型，可选择参数为：c1,c2,a1,a2,b1,b2；当subject=4时可省略
//testType	string	否	测试类型，rand：随机测试（随机100个题目），order：顺序测试（所选科目全部题目）


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showAnimation];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.subjects = [[NSMutableArray alloc] init];
	[self UIinit];
    [self continueViewUIinit];
    
	
}



-(void)UIinit {

    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    [self btnAnimtionInit];
}
-(void)continueViewUIinit {
    self.continueView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.continueView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.continueView];
    
    CGFloat btnWidth = 200;
    CGFloat btnHeight = 70;
    CGFloat leftDistance = (SCREEN_WIDTH - 200)/2;
    
    _continueBtn = [[UIButton alloc] initWithFrame:CGRectMake(leftDistance, 50, btnWidth, btnHeight)];
    _continueBtn.backgroundColor = [UIColor yellowColor];
    _continueBtn.layer.masksToBounds = YES;
    _continueBtn.layer.cornerRadius = 8.0;
    [_continueBtn addTarget:self action:@selector(continueBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_continueView addSubview:_continueBtn];
    
    _reStartBtn = [[UIButton alloc] initWithFrame:CGRectMake(leftDistance, CGRectGetMaxY(_continueBtn.frame) +20, btnWidth, btnHeight)];
    _reStartBtn.backgroundColor = [UIColor yellowColor];
    _reStartBtn.layer.masksToBounds = YES;
    _reStartBtn.layer.cornerRadius = 8.0;
    [_reStartBtn addTarget:self action:@selector(restartBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [_continueView addSubview:_reStartBtn];
    
    [self showAnimation];
    
}

- (void)showAnimation {
    //出场动画
    CATransform3D transform = CATransform3DMakeTranslation(-500, 0, 0);
    _continueBtn.alpha = 0;
    _reStartBtn.alpha = 0;
    _continueBtn.layer.transform = transform;
    _reStartBtn.layer.transform = transform;
    [UIView animateKeyframesWithDuration:1.2 delay:0.0 options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            _continueBtn.layer.transform = CATransform3DIdentity;
            _continueBtn.alpha = 1;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            _reStartBtn.layer.transform = CATransform3DIdentity;
            _reStartBtn.alpha = 1;
            
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}

-(void)btnAnimtionInit {
    
    CGFloat animationTime = 0.6;
    
    _btnAnimation= [CABasicAnimation animationWithKeyPath:@"transform"];
    _btnAnimation.duration = animationTime;
    _btnAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    CATransform3D transform = CATransform3DMakeScale(1.3, 1.3, 1.0);
    _btnAnimation.fromValue = [NSValue  valueWithCATransform3D:transform];
    _btnAnimation.repeatCount = 1;
    _btnAnimation.autoreverses = YES;
}

//-(void)animationInit{
//    _btnAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
//    
//    _btnAnimation.repeatCount = 1;
//    _btnAnimation.duration = 0.2;
//    _btnAnimation.autoreverses = YES;
//    CATransform3D transform = CATransform3DMakeScale(<#CGFloat sx#>, <#CGFloat sy#>, <#CGFloat sz#>)
//    
//}


#pragma mark  ---Actions
-(void)restartBtnAction {
    
    QuestionTestViewController *vc = [[QuestionTestViewController alloc] initWithType:ListTest];
    [self.rdv_tabBarController.navigationController pushViewController:vc animated:YES];
}

-(void)continueBtnAction {
    
    QuestionTestViewController *vc = [[QuestionTestViewController alloc] initWithType:ListTest];
    [self.rdv_tabBarController.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark  ----UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


#pragma mark  =========other========
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
