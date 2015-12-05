//
//  ComplicationController.m
//  Dishwasher Trivia WatchKit Extension
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "ComplicationController.h"
#import "ComplicationManager.h"

@interface ComplicationController ()

@end

@implementation ComplicationController

#pragma mark - Timeline Configuration

- (void)getSupportedTimeTravelDirectionsForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimeTravelDirections directions))handler {
    handler(CLKComplicationTimeTravelDirectionForward|CLKComplicationTimeTravelDirectionBackward);
}

- (void)getTimelineStartDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler(nil);
}

- (void)getTimelineEndDateForComplication:(CLKComplication *)complication withHandler:(void(^)(NSDate * __nullable date))handler {
    handler(nil);
}

- (void)getPrivacyBehaviorForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationPrivacyBehavior privacyBehavior))handler {
    //Decesion to show on lock screen or not
    handler(CLKComplicationPrivacyBehaviorShowOnLockScreen);
}

#pragma mark - Timeline Population


//Complication Controller getCurrentTimelineEntryForComplication
- (void)getCurrentTimelineEntryForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTimelineEntry * __nullable))handler {
    // Call the handler with the current timeline entry
    CLKComplicationTimelineEntry *timeEntry = [[CLKComplicationTimelineEntry alloc] init];
    switch (complication.family) {
        case CLKComplicationFamilyUtilitarianSmall:
        {
            CLKComplicationTemplateUtilitarianSmallRingText *myComplicationTemplate = [[CLKComplicationTemplateUtilitarianSmallRingText alloc] init];
            myComplicationTemplate.fillFraction = 0.7;
            myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
            myComplicationTemplate.textProvider = [CLKSimpleTextProvider textProviderWithText:@"--"];
            myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
            [timeEntry setComplicationTemplate:myComplicationTemplate];
        }
        default:
            break;
    }
    [timeEntry setDate:[NSDate date]];
    handler(timeEntry);
}

- (void)getTimelineEntriesForComplication:(CLKComplication *)complication beforeDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    // Call the handler with the timeline entries prior to the given date
    handler(nil);
}






//Complication Controller Get Timeline Entries After Date
- (void)getTimelineEntriesForComplication:(CLKComplication *)complication afterDate:(NSDate *)date limit:(NSUInteger)limit withHandler:(void(^)(NSArray<CLKComplicationTimelineEntry *> * __nullable entries))handler {
    // Call the handler with the timeline entries after to the given date
    NSMutableArray *timeEnts = [[NSMutableArray alloc] init];
    NSArray *compValues = [ComplicationManager getStatusFromDate:date];
    
    for(DishwasherCurrentStatus *status in compValues){
        CLKComplicationTimelineEntry *timeEntry = [[CLKComplicationTimelineEntry alloc] init];
        switch (complication.family) {
            case CLKComplicationFamilyUtilitarianSmall:
            {
                CLKComplicationTemplateUtilitarianSmallRingText *myComplicationTemplate = [[CLKComplicationTemplateUtilitarianSmallRingText alloc] init];
                myComplicationTemplate.fillFraction = status.percentDone.floatValue;
                myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
                myComplicationTemplate.textProvider = [CLKSimpleTextProvider textProviderWithText:status.statusName];
                myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
                [timeEntry setComplicationTemplate:myComplicationTemplate];
                [timeEntry setDate:status.startTime];
                [timeEnts addObject:timeEntry];
            }
            default:
                break;
        }
    }
    
    handler(timeEnts);
}

#pragma mark Update Scheduling

- (void)getNextRequestedUpdateDateWithHandler:(void(^)(NSDate * __nullable updateDate))handler {
    // Call the handler with the date when you would next like to be given the opportunity to update your complication content
    
    //Dishwasher want the complication to be very granular ... 60 seconds
    handler([NSDate dateWithTimeIntervalSinceNow:60]);
}

#pragma mark - Placeholder Templates




//Complication Controller Get Placeholder Complication Template
- (void)getPlaceholderTemplateForComplication:(CLKComplication *)complication withHandler:(void(^)(CLKComplicationTemplate * __nullable complicationTemplate))handler {
    // This method will be called once per supported complication, and the results will be cached
    CLKComplicationTemplate *template = nil;
    switch (complication.family) {
        case CLKComplicationFamilyUtilitarianSmall:
        {
            CLKComplicationTemplateUtilitarianSmallRingText *myComplicationTemplate = [[CLKComplicationTemplateUtilitarianSmallRingText alloc] init];
            myComplicationTemplate.fillFraction = 0.7;
            myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
            myComplicationTemplate.textProvider = [CLKSimpleTextProvider textProviderWithText:@"--"];
            myComplicationTemplate.ringStyle = CLKComplicationRingStyleOpen;
            template = myComplicationTemplate;
        }
        default:
            break;
    }
    handler(template);
}

@end
