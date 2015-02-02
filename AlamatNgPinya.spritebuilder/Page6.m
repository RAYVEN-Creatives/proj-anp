//
//  Page6.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page6.h"

@implementation Page6

{
    CCNode *_pinangNode;
    CCSprite *_alingRosaNode;
}

- (void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // notice
    CCLOG(@"Page 6 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    if (CGRectContainsPoint([_pinangNode boundingBox], touchLocation)) {
        // play alingRosaShake
        [_alingRosaNode.animationManager runAnimationsForSequenceNamed:@"Shake It"];
    }
}

@end
