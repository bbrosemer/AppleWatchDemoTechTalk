//
//  GlanceController.m
//  Dishwasher Trivia WatchKit Extension
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "GlanceController.h"
#import "ComplicationManager.h"
#import <DWKitWatch/DWKitWatch.h>

@interface GlanceController()

@end


@implementation GlanceController


//Glance Controller Awake With Context
//Glance Controller Awake With Context
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
    DishwasherCurrentStatus *status = [ComplicationManager currentStatus];
    [self.status setText:status.statusName];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



