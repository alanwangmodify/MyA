//
//  DataBaseManage.h
//  Choumeimeifa
//
//  Created by iMac on 15/4/1.
//  Copyright (c) 2015年 xiaokang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DataBaseManage : NSObject

+ (id)sharedInstance;

@property (retain,nonatomic, readonly) NSManagedObjectContext       *managedObjectContext;
@property (retain,nonatomic, readonly) NSManagedObjectModel         *managedObjectModel;
@property (retain,nonatomic, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NSManagedObjectContext*)getSingleManagedObjectContext;

@end
