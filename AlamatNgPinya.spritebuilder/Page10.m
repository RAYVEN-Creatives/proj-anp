//
//  Page10.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 2/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page10.h"

@implementation Page10

{
    CCNode *_spawnNode;
    NSMutableArray *_leavesNode;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // disable spawnNode collision
    _spawnNode.physicsBody.collisionMask = @[];
    
    // TEST
    [self explodeLeaves];
    
    // notice
    CCLOG(@"Page 10 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    
}

- (void) explodeLeaves {
    CCLOG(@"BOOM LEAVES!");
    // TEST: SPAWN MANY LEAVES!!!! BWAHAHAHAHAHA
    for(int i = 0; i < 20; i++) {
        CCNode *test = [CCNode new];
        CCSprite *spritetest = (CCSprite*)[CCBReader load:@"assets/ccbFiles/Leaf"];
        spritetest.scale = 2.f;
        [test addChild:spritetest];
        [_spawnNode addChild:test];
        [_leavesNode addObject:test];
        
    }
}

@end
