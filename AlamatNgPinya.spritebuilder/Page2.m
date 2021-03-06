//
//  Page2.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page2.h"

@implementation Page2

{
    int emissionRate;
    CCAction *move;
    CCNode *_clothesNode;
    CCParticleSystem *_bubbleNode;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page2
    CCLOG(@"Page 2 loaded.");
    
    // stop bubble emission on first stage
    _bubbleNode.emissionRate = 0.0;
    
    // emission rate upon "rubbing the clothes"
    emissionRate = 0;
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // bubbles!!
    // gets touch location
    CGPoint touchLocation = [touch locationInWorld];
    // activate babols
    [self bubbleGrow:&touchLocation];
}

-(void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    // activate babols mode
    [self bubbleGrow:&touchLocation];
}

-(void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // stop babols ~
    _bubbleNode.emissionRate = 0;
    emissionRate = 0;
}

-(void) touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // stop babols ~
    _bubbleNode.emissionRate = 0;
    emissionRate = 0;
}

// Grow some bubbles!!!
-(void) bubbleGrow:(CGPoint *) touchLocation {
    if (CGRectContainsPoint([_clothesNode boundingBox], *touchLocation)) {
        if (emissionRate > 50) {
            emissionRate = 50;
            _bubbleNode.emissionRate = emissionRate;
        }
        else _bubbleNode.emissionRate += emissionRate++;
    }
}

@end
