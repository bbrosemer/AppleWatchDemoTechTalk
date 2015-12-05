//
//  HRMonitor.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "HRMonitor.h"
#import <WatchConnectivity/WatchConnectivity.h>
#import <HealthKit/HealthKit.h>

@interface HRMonitor (){
    NSTimer *_timer;
    HKHealthStore* healthStore;
    HKWorkoutSession* wos;
}

@end

@implementation HRMonitor

float hrValue = 60.0f;

//Awake with context setup HRAwakeWithContext
-(void)awakeWithHRContext:(id)interfaceController{
    if([WCSession class] && [WCSession isSupported]){
        WCSession* session = [WCSession defaultSession];
        session.delegate = interfaceController;
        [session activateSession];
    }
    
    NSSet* readobject = [NSSet setWithObjects:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate],[HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],nil];
    NSSet* shareobject = [NSSet setWithObjects:[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],[HKObjectType workoutType],[HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate], nil];
    
    healthStore = [[HKHealthStore alloc]init];
    
    [healthStore requestAuthorizationToShareTypes:shareobject readTypes:readobject completion:^(BOOL success, NSError *error){
        if(!success)
        {
            NSLog(@"%@",error);
        }
        else
        {
            NSLog(@"OK");
        }
    }];
}

#pragma mark HRMonitor

//HR Get user Heartrate

-(void)getHeartRate{
    healthStore = [[HKHealthStore alloc]init];
    
    wos = [[HKWorkoutSession alloc]initWithActivityType:HKWorkoutActivityTypeRunning locationType:HKWorkoutSessionLocationTypeIndoor];
    
    [wos delegate];
    [healthStore startWorkoutSession:wos];
    
    
    NSDate* curDate = [[NSDate alloc]init];
    
    NSPredicate* predicate = [HKQuery predicateForSamplesWithStartDate:curDate endDate:nil options:HKQueryOptionNone];
    
    HKQuantityType* type = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeartRate];
    
    HKAnchoredObjectQuery* query = [[HKAnchoredObjectQuery alloc]initWithType:type predicate:predicate anchor:0 limit:0 resultsHandler:^(HKAnchoredObjectQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable sampleObjects, NSArray<HKDeletedObject *> * _Nullable deletedObjects, HKQueryAnchor * _Nullable newAnchor, NSError * _Nullable error) {
        
        //NSLog(@"%@",[sampleObjects description]);
    }];
    
    HKUnit* unit = [HKUnit unitFromString:@"count/min"];
    
    [query setUpdateHandler:^(HKAnchoredObjectQuery *query, NSArray<__kindof HKSample *> * __nullable addedObjects, NSArray<HKDeletedObject *> * __nullable deletedObjects, HKQueryAnchor * __nullable newAnchor, NSError * __nullable error) {
        
        HKQuantitySample* hr = addedObjects[0];
        HKQuantity* qty = [hr quantity];
        double bpm = [qty doubleValueForUnit:unit];
        [healthStore endWorkoutSession:wos];
        NSLog(@"%f",bpm);
        //[self checkHeartRate:bpm];
    }];
    
    [healthStore executeQuery:query];
}

-(float)getTheHR{
    return hrValue;
}

//Be sure to add the return delegate method for the HR 

#pragma mark HRTimerFunctions


//HR Timing Functions
-(void)startHRTimer{
    [self startTimer];
}

-(void)myTimerCallback{
    NSLog(@"Check");
    [self getHeartRate];
}

- (void)startTimer{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0f
                                                  target:self
                                                selector:@selector(myTimerCallback)
                                                userInfo:nil
                                                 repeats:YES];
    }
}

- (void)stopTimer{
    if ([_timer isValid]) {
        [_timer invalidate];
    }
    _timer = nil;
}

    

@end
