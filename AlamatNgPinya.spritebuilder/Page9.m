//
//  Page9.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page9.h"

@implementation Page9

{
    CCNode *_neighborNode;
    CCNode *_qmNode;
}

- (void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // notice
    CCLOG(@"Page 9 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // if user touches neighbor
    if (CGRectContainsPoint([_neighborNode boundingBox], touchLocation)) {
        
        // remove child (less memory)
        [_qmNode removeAllChildren];
        
        // load question mark
        CCSprite *qm = (CCSprite *)[CCBReader load:@"assets/ccbFiles/QuestionMark"];
        
        // add it to node (qmark appears)
        [_qmNode addChild:qm];
    }
}

@end
