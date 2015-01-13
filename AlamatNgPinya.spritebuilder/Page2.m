//
//  Page2.m
//  PhysicsTest
//
//  Created by Ray Venenoso on 12/15/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Page2.h"

@implementation Page2

{
    int emissionRate;
    CCAction *move;
    CCNode *_clothesNode;
    CCNode *_basinNode;
    CCNode *_kaboNode;
    CCNode *_kaboBoundary;
    CCParticleSystem *_bubbleNode;
    CCSprite *_kaboSprite;
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
        if (emissionRate > 300) {
            emissionRate = 300;
            _bubbleNode.emissionRate = emissionRate;
        }
        else _bubbleNode.emissionRate = emissionRate++;
    }
}

//// make kabo move!
//-(void) kaboTap:(CGPoint *) touchLocation {
//    if (CGRectContainsPoint([_kaboNode boundingBox], *touchLocation)) {
//        [_kaboSprite.animationManager runAnimationsForSequenceNamed:@"SinkAndFloat"];
//    }
//}

// next/prev pages
-(void) nextPage {
    CCLOG(@"Next page");
    // shift pages to page3
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page3"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

-(void) prevPage {
    CCLOG(@"Previous page");
    // shift pages to page2
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
