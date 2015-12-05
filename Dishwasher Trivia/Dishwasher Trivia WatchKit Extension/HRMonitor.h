//
//  HRMonitor.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol HRMonitorDelegate
@optional
-(void)gotHRWithBBPM:(NSNumber *)bpm;
@end

@interface HRMonitor : NSObject{
}

@property(nonatomic,retain)id <HRMonitorDelegate> hrDelegate;
-(void)awakeWithHRContext:(id)interfaceController;
-(void)startHRTimer;


+(float)getTheHR;


@end
