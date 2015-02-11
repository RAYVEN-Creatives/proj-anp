//
//  Page7.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page7.h"

@implementation Page7

{
    CCNode *_leftEyeNode;
    CCNode *_rightEyeNode;
    CCSprite *_pinangEyesNode;
    BOOL firstClick;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // load page...
    CCLOG(@"Page 7 loaded.");
    
    // disable first click (on pinang's eyes)
    firstClick = FALSE;
}

// BUG: Need to disable click while Pinang is still crying
- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // if user touches pinang's eyes...
    if (CGRectContainsPoint([_leftEyeNode boundingBox], touchLocation) || CGRectContainsPoint([_rightEyeNode boundingBox], touchLocation)) {
        
        // play Crying
        if (firstClick) {
            [_pinangEyesNode.animationManager runAnimationsForSequenceNamed:@"Crying"];
            firstClick = FALSE;
        } else [_pinangEyesNode.animationManager runAnimationsForSequenceNamed:@"ContinueCrying"];
    }
}

@end
