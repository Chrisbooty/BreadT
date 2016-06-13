//
//  CJTools.m
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//

#import "CJTools.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "IntersetModel.h"
#import "ScrollViewModel.h"

@implementation CJTools
{
    NSManagedObjectContext *_context;
}

+ (instancetype)sharedTool
{
    static CJTools *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[CJTools alloc] init];
    });
    return tool;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        AppDelegate *app = [UIApplication sharedApplication].delegate;
        _context = app.managedObjectContext;
    }
    return self;
}

- (NSArray *)searchEntity:(NSString *)name
{
    NSFetchRequest *req = [NSFetchRequest fetchRequestWithEntityName:name];
    return [_context executeFetchRequest:req error:nil];
}

- (void)deleteAllObjectWithEntityName:(NSString *)name
{
    NSArray *arr =  [self searchEntity:name];
    for (id obj in arr) {
        [_context deleteObject:obj];
    }
    [_context save:nil];
}

- (void)insertEntityWithName:(NSString *)name withModel:(id)model
{
    NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:_context];
    if ([name isEqualToString:@"ScrollViewModel"]) {
        [obj setValue:[model valueForKey:@"image_url"] forKey:@"image_url"];
    }else if ([name isEqualToString:@"IntersetModel"])
    {
        [obj setValue:[model valueForKey:@"text"] forKey:@"text"];
        [obj setValue:[model valueForKey:@"spot_id"] forKey:@"spot_id"];
        [obj setValue:[[model valueForKey:@"user"] valueForKey:@"avatar_m"] forKey:@"avatar_m"];
        [obj setValue:[[model valueForKey:@"user"] valueForKey:@"name"] forKey:@"name"];
        [obj setValue:[model valueForKey:@"cover_image"] forKey:@"cover_image"];
    }
    [_context save:nil];
}

@end
