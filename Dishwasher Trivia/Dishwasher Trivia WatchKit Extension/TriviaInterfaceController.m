//
//  TriviaInterfaceController.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 11/29/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "TriviaInterfaceController.h"
#import "TriviaPickerItem.h"
#import "HRMonitor.h"

@interface TriviaInterfaceController ()

@end

@implementation TriviaInterfaceController

//Trivia Interface Controller Will Activate
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    [self.triviaAnswers focus];
    
    NSArray *buildItems = [self buildWKPickerItems];
    //TriviaInterfaceController Set WKPickerItems
    [self.triviaAnswers setItems:buildItems];
    [self.triviaAnswers setSelectedItemIndex:0];
}



- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

//TriviaInterfacePicker Action Selection Old
//- (IBAction)pickerAction:(NSInteger)index{
//    //Random point value assigned
//    
//}

//TriviaInterfacePicker HR Action Selection // change the point value to be assigned based on the HR rather than a random point value 
- (IBAction)pickerAction:(NSInteger)index{
    //Do logic to determing if correct answer
    if([self isCorrectAnswer]){
        [HRMonitor getTheHR];
    }
}


//TriviaInterfaceController Build WK Picker Items ( Get the items that will show up in trivia from the iphone / dishwasher API
-(NSArray *)buildWKPickerItems{
    //Get the trivia questions
    NSMutableArray *pickerItems = [NSMutableArray new];
    DishwasherTriviaQuestionObject *dwtqo = [((NSArray *)[DishwasherTriviaManager getCurrentQuestions]) objectAtIndex:0];
    NSArray * incorrectAnswers = dwtqo.incorrectAnswers;
    for(DishwasherTriviaObject *incorrectAnswer in incorrectAnswers){
        TriviaPickerItem *item = [[TriviaPickerItem alloc] init];
        [item setDishwasherTriviaObject:incorrectAnswer];
        [pickerItems addObject:item];
    }
    TriviaPickerItem *correctAnswer = [[TriviaPickerItem alloc] init];
    [correctAnswer setDishwasherTriviaObject:dwtqo.correctAnswer];
    [pickerItems addObject:correctAnswer];
    [pickerItems shuffle];
    NSArray *shuffledArray = [NSArray arrayWithArray:pickerItems];
    return shuffledArray;
}





























































































-(BOOL)isCorrectAnswer{
    return YES;
}

@end



