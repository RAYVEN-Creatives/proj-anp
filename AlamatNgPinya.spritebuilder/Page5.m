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
    CCNode *_block;
    CCPhysicsNode *_physicsNode;
    NSArray *_blocksArray;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // DEBUG: enable physics debug mode
    _physicsNode.debugDraw = TRUE;
    
    // add blocks to array
    _blocksArray = [NSArray arrayWithObjects:_block, nil];
    
    // notice
    CCLOG(@"Page 5 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get array count]
    CGPoint touchLocation = [touch locationInNode:_physicsNode];
    CCSprite *test = (CCSprite*) [CCBReader load: @"assets/ccbFiles/Block"];
    /*
    for (int i = 0; i < [_blocksArray count]; i++) {
        if (CGRectContainsPoint(((CCSprite*)_blocksArray[i]).boundingBox, touchLocation)) {
            CCLOG(@"Touching...");
        } else CCLOG(@"You failed. lol.");
    }*/
    if (CGRectContainsPoint([test boundingBox], touchLocation)) {
        CCLOG(@"Touching...");
    } else CCLOG(@"You failed. lol.");
}

- (void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Moving...");
}

// add blocks to screen
- (void) addBlocks {
    
    //_blocksArray = [NSArray arrayWithObjects: _block1, _block2, _block3, _block4, _block5, nil];
}

@end
