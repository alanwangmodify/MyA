//
//  DataBaseManage.m
//  Choumeimeifa
//
//  Created by iMac on 15/4/1.
//  Copyright (c) 2015年 xiaokang. All rights reserved.
//

#import "DataBaseManage.h"
static NSManagedObjectContext *gloabContext =nil;

@implementation DataBaseManage

@synthesize managedObjectContext=__managedObjectContext;
@synthesize managedObjectModel=__managedObjectModel;
@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;

+ (id)sharedInstance
{
    static id SharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (SharedInstance == nil) {
            SharedInstance = [[self alloc] init];
        }
    });
    return SharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        [[self class] setSingleManagedObjectContext: [self managedObjectContext]];
    }
    return self;
}

+ (void)setSingleManagedObjectContext:(NSManagedObjectContext*)manageContext{
    
    gloabContext = manageContext;
}


#pragma mark - Core Data stack

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Frame" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return __managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil) {
        return __persistentStoreCoordinator;
    }
    
    //    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CMDataModel.sqlite"]; //version under 3.0.4
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Choumeimeifa.sqlite"];
    
    // handle db upgrade 迁移
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]){
        
    }
    
    return __persistentStoreCoordinator;
}


- (NSURL *)applicationDocumentsDirectory{
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


+ (NSManagedObjectContext*)getSingleManagedObjectContext{
    return gloabContext;
}




@end
