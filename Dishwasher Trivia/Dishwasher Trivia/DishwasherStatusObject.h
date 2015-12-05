//
//  DishwasherStatusObject.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DishwasherCurrentStatus.h"

@interface DishwasherStatusObject : NSObject

@property(nonatomic,retain)DishwasherCurrentStatus *dwsCurrent;
@property(nonatomic,retain)NSMutableArray *dwsPastStatuses;
@property(nonatomic,retain)NSMutableArray *dwsFutureStatuses;


@end
