//
//  Page5.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/30/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page5.h"

@implementation Page5

{
    CCNode *_testNode;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // notice
    CCLOG(@"Page 5 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInWorld];
    if (CGRectContainsPoint([_testNode boundingBox], touchLocation)) {
        CCLOG(@"Touching..");
    }
}

- (void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Moving...");
}

- (void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Ending..");
}

- (void) touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Canceling...");
}

@end
