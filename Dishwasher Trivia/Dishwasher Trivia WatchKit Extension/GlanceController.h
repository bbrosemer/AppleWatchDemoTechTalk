//
//  GlanceController.h
//  Dishwasher Trivia WatchKit Extension
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface GlanceController : WKInterfaceController
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *status;

@end
