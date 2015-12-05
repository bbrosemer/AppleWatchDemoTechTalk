//
//  NotificationController.m
//  Dishwasher Trivia WatchKit Extension
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "NotificationController.h"
@import UIKit.UILocalNotification;

@interface NotificationController()

@end


@implementation NotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}


- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    //[self.userName setText:[localNotification.userInfo valueForKey:@"userName"]];
    //[self.dwStatus setText:[localNotification.userInfo valueForKey:@"dwStatus"]];
    [self.userName setText:@"Testing"];
    [self.dwStatus setText:@"Testing"];
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


//Dynamic notifications are realllllly powerful if you need them to be for deep linking.
- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    
    [self.userName setText:[remoteNotification valueForKey:@"userName"]];
    [self.dwStatus setText:[remoteNotification valueForKey:@"contentUpdates"]];
    
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



