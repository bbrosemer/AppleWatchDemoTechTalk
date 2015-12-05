//
//  ComplicationManager.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 12/1/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "ComplicationManager.h"

@implementation ComplicationManager

+(NSArray *)getStatusFromDate:(NSDate *)fromdate{
    return [self buildDemoStauts];
}

float placeHolderTimeSeconds= 120;


+(NSArray *)buildDemoStauts{
    NSMutableArray *demoStatus = [[NSMutableArray alloc] init];
    for(int i = 1; i <= 11 ; i ++){
        DishwasherCurrentStatus *curStat = [[DishwasherCurrentStatus alloc] init];
        [curStat setStartTime:[NSDate dateWithTimeIntervalSinceNow:(placeHolderTimeSeconds * i)]];
        [curStat setPercentDone:[NSNumber numberWithFloat:(i-1.0)*10.0/100.0]];
        [curStat setStatusName:curStat.percentDone.stringValue];
        [demoStatus addObject:curStat];
    }
    return demoStatus;
}


+(DishwasherCurrentStatus *)currentStatus{
    DishwasherCurrentStatus *curStat = [[DishwasherCurrentStatus alloc] init];
    [curStat setStartTime:[NSDate dateWithTimeIntervalSinceNow:(placeHolderTimeSeconds)]];
    [curStat setPercentDone:[NSNumber numberWithFloat:.7]];
    [curStat setStatusName:@"10 minutes remaining"];
    return curStat;
}

@end
