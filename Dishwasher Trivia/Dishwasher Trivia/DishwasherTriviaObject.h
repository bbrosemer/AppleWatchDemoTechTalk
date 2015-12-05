//
//  DishwasherTriviaObject.h
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DishwasherTriviaObject : NSObject

@property(nonatomic,retain)NSString *title;

-(NSUUID *)getQuestionID;

@end
