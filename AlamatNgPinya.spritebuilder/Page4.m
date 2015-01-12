//
//  Page4.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/12/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page4.h"

@implementation Page4
{
    CCNode *_potNode;
    CCNode *_burnEffectNode1;
    CCNode *_burnEffectNode2;
    CCNode *_burnEffectNode3;
    CCNode *_burnEffectNode4;
    CCPhysicsNode *_physicsNode;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 4 loaded.");
    
    _burnEffectNode1.opacity = 0.00f;
    _burnEffectNode2.opacity = 0.00f;
    _burnEffectNode3.opacity = 0.00f;
    _burnEffectNode4.opacity = 0.00f;
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [self burnFadeEffect];
}

-(void) burnFadeEffect {
    // show by animation
    CCActionFadeIn *fadeIn = [CCActionFadeIn actionWithDuration:0.2]; // fade in
    CCActionDelay *delay = [CCActionDelay actionWithDuration:0.1f]; // some delays...
    CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:0.2]; // fade out
    CCActionSequence *testAction = [CCActionSequence actionWithArray:@[fadeIn, delay, fadeOut]]; // sequence them here
    [_burnEffectNode1 runAction:testAction]; // connect sequence to node
    [_burnEffectNode2 runAction:testAction]; // connect sequence to node
    [_burnEffectNode3 runAction:testAction]; // connect sequence to node
    [_burnEffectNode4 runAction:testAction]; // connect sequence to node
}

// next/prev pages
-(void) nextPage {
    CCLOG(@"Next page");
    // shift pages to page4
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page5"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

-(void) prevPage {
    CCLOG(@"Previous page");
    // shift page backward
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page3"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
