//
//  TriviaPickerItem.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 12/1/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <DWKitWatch/DWKitWatch.h>

@interface TriviaPickerItem : WKPickerItem

@property(nonatomic,retain)DishwasherTriviaObject *triviaObject;
-(void)setDishwasherTriviaObject:(DishwasherTriviaObject *)triviaObject;

@end
