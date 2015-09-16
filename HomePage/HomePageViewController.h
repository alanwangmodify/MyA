//
//  HomePageViewController.h
//  Frame
//
//  Created by choumei_mac on 14/12/30.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import "DetailViewController.h"
#import "CityWeatherModel.h"
#import "CatalogModel.h"
#import "CatalogViewController.h"
#import "QuestionTestViewController.h"

@interface HomePageViewController : ViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (nonatomic,strong) UICollectionView *collectionView;

@end
