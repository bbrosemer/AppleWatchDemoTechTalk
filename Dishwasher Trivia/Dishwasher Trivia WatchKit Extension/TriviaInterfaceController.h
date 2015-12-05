//
//  TriviaInterfaceController.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>
#import <DWKitWatch/DWKitWatch.h>

@interface TriviaInterfaceController : WKInterfaceController 

@property (strong, nonatomic) IBOutlet WKInterfacePicker *triviaAnswers;


@end
