//
//  DishwasherTriviaQuestionObject.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DishwasherTriviaObject.h"

@interface DishwasherTriviaQuestionObject : NSObject

@property(nonatomic,retain)NSMutableArray *incorrectAnswers;
@property(nonatomic,retain)DishwasherTriviaObject *correctAnswer;
@property(nonatomic,retain)NSNumber *pointsScored;

@end
