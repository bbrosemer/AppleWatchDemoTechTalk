//
//  NotificationController.h
//  Dishwasher Trivia WatchKit Extension
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface NotificationController : WKUserNotificationInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *userName;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *dwStatus;

@end
