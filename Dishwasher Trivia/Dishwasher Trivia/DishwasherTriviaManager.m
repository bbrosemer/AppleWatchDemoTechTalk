//
//  DishwasherTriviaManager.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "DishwasherTriviaManager.h"
#import "DishwasherTriviaObject.h"
#import "DishwasherTriviaQuestionObject.h"


@implementation DishwasherTriviaManager

+(void)setPoints:(NSNumber *)points{
    
}

+(void)getConnectionInfo{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:@"http://mydishwaser.com"]];

    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error)
                                  {
                                      NSData *theData = [[NSString alloc]initWithBytes:[data bytes] length:[data length] encoding:NSUTF8StringEncoding];
                                      NSLog(@"%@", theData);
                                  }];
    [task resume];
}

+(NSArray *)getCurrentQuestions{
    NSMutableArray *questionArray = [NSMutableArray new];
    for(int i = 0 ; i < 10 ; i++){
        DishwasherTriviaQuestionObject *newObject = [[DishwasherTriviaQuestionObject alloc] init];
        DishwasherTriviaObject *dto =[[DishwasherTriviaObject alloc] init];
        [dto setTitle:@"WatchKit"];
        [newObject setCorrectAnswer:dto];
        
        DishwasherTriviaObject *dtoNot =[[DishwasherTriviaObject alloc] init];
        [dtoNot setTitle:@"Not WatchKit"];
        [newObject setIncorrectAnswers:[[NSMutableArray alloc] initWithObjects:dtoNot,dtoNot,dtoNot, nil]];
        [questionArray addObject:newObject];
        //newObject set
    }
    return questionArray;
}

@end
