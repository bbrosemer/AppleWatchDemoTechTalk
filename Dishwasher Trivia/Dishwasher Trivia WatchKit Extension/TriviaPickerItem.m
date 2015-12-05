//
//  TriviaPickerItem.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 12/1/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "TriviaPickerItem.h"

@interface TriviaPickerItem (private)
@end


@implementation TriviaPickerItem


//Trivia Picker Item Set Trivia Object
-(void)setDishwasherTriviaObject:(DishwasherTriviaObject *)triviaObject{
    self.triviaObject = triviaObject;
    self.title = self.triviaObject.title;
    self.caption = self.triviaObject.title;
}


@end
