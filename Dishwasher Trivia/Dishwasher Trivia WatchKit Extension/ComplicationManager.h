//
//  ComplicationManager.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 12/1/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DWKitWatch/DWKitWatch.h>


@interface ComplicationManager : NSObject

+(NSArray *)getStatusFromDate:(NSDate *)fromdate;

+(DishwasherCurrentStatus *)currentStatus;

@end
