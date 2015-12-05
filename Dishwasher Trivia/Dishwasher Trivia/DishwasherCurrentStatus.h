//
//  DishwasherCurrentStatus.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DishwasherCurrentStatus : NSObject

@property(nonatomic,retain)NSString *statusName;
@property(nonatomic,retain)NSDate *startTime;
@property(nonatomic,retain)NSDate *endTime;
@property(nonatomic,retain)NSNumber *percentDone;

@end
