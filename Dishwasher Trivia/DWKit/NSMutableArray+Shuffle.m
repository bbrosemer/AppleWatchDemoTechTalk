//
//  NSMutableArray+Shuffle.m
//  Dishwasher Trivia
//
//  Created by Brandyn Brosemer on 12/1/15.
//  Copyright © 2015 bbrosemer. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)

- (void)shuffle{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
