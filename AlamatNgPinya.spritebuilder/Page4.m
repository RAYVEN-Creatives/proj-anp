//
//  Page4.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page4.h"

@implementation Page4

{
    CCNode *_burnEffectNode;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // show current page
    CCLOG(@"Page 4 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [self burnEffect];
}

- (void) burnEffect {
    // remove all children
    [_burnEffectNode removeAllChildren];
    
    // load sprite to
    CCSprite *be = (CCSprite*) [CCBReader load:@"assets/ccbFiles/BurnEffect"];

    // add effect to child
    [_burnEffectNode addChild:be];
    
    // play burn effect
    [be.animationManager runAnimationsForSequenceNamed:@"Touch Pot"];
}

@end
