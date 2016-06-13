//
//  CJHeader.h
//  CJBreadTravel
//
//  Created by mac on 16/6/13.
//  Copyright © 2016年 Cijian.Wu. All rights reserved.
//



#ifndef CJHeader_h
#define CJHeader_h

#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "JSONModel.h"
#import "CJScrollViewModel.h"
#import "CJIntersetModel.h"
#import "CJScrollViewTableCell.h"
#import "CJIntersetCell.h"
#import "CJIntersetCollectionCell.h"
#import "CJSpecialModel.h"
#import "CJSpecialTableCell.h"
#import "CJStoryDetailsModel.h"
#import "CJStoryContentModel.h"
#import "CJDetailsTableCell.h"
#import "CJUserDetailsCell.h"
#import "ScrollViewModel.h"
#import "IntersetModel.h"
#import "CJTools.h"

#define INDEX_URL @"http://api.breadtrip.com/v2/index/"

#define DETAILS_URL @"http://api.breadtrip.com/v2/new_trip/spot/?spot_id=%@"

#define SPECIAL_URL @"http://api.breadtrip.com/trips/%@/waypoints/?gallery_mode=1&sign=eb31fb8abff119cf87ef1c71821ee637"

#endif /* CJHeader_h */
