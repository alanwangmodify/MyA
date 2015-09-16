//
//  AppDelegate.h
//  Frame
//
//  Created by choumei_mac on 14/12/28.
//  Copyright (c) 2014年 choumei_mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "TabBarViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate,RDVTabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) TabBarViewController *mainBarController;

+ (AppDelegate *)getAppDelegate;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

