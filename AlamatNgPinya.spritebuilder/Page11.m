//
//  Page11.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page11.h"

@implementation Page11

{
    CCNode *_waterDropNode;
    CCNode *_sprinklerNode;
}

- (void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // notice
    CCLOG(@"Page 11 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // if user touches neighbor
    if (CGRectContainsPoint([_sprinklerNode boundingBox], touchLocation)) {
        // remove all children
        [_waterDropNode removeAllChildren];
        
        // load waterdrop particle
        CCParticleSystem *drops = (CCParticleSystem *)[CCBReader load:@"assets/ccbFiles/WaterDrops"];
        
        // position of drops
        drops.position = ccp(224, 158);
        drops.rotation = 50.f;
        
        // throws drops (add to parent)
        [_waterDropNode.parent addChild:drops];
    }
}

@end
