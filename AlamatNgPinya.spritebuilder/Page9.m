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
    CCSprite *_qmarkSprite;
    int qnum;
}

- (void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // number of question marks
    qnum = 1;
    
    // notice
    CCLOG(@"Page 9 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // if user touches neighbor
    if (CGRectContainsPoint([_neighborNode boundingBox], touchLocation)) {
        if (qnum <= 3) {
            // call scene
            NSString *q = [NSString stringWithFormat:@"Q%u", qnum];
            
            // appear question mark ~~~
            [_qmarkSprite.animationManager runAnimationsForSequenceNamed:q];
            qnum++;
        }
    }
}

@end
