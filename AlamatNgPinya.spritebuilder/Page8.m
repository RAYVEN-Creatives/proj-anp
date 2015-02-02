//
//  Page8.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page8.h"

@implementation Page8

{
    CCNode *_birdNode;
    CCSprite *_birdSprite;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // notice
    CCLOG(@"Page 8 loaded.");
}

// BUG: Need to disable click while bird is flying
- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // if user touches the bird...
    if (CGRectContainsPoint([_birdNode boundingBox], touchLocation)) {
        
        // bird, fly ~~~
        [_birdSprite.animationManager runAnimationsForSequenceNamed:@"Fly"];
    }
}

@end
