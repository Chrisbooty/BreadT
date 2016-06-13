//
//  IntersetModel+CoreDataProperties.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "IntersetModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface IntersetModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *text;
@property (nullable, nonatomic, retain) NSNumber *spot_id;
@property (nullable, nonatomic, retain) NSString *avatar_m;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *cover_image;

@end

NS_ASSUME_NONNULL_END
