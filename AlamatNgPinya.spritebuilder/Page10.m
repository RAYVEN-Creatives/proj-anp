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
    CCNode *_mouseJointNode;
    CCPhysicsJoint *_mouseJoint;
    CCPhysicsNode *_physicsNode;
    NSMutableArray *_leavesArray;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // DEBUG: enable physics debug mode
    _physicsNode.debugDraw = TRUE;
    
    // disable spawnNode collision
    _spawnNode.physicsBody.collisionMask = @[];
    
    // disable mouseJointNode collision
    _mouseJointNode.physicsBody.collisionMask =@[];
    
    // TEST
    [self explodeLeaves];
    
    // notice
    CCLOG(@"Page 10 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // check if touch is within the blocks
    for(int i = 0; i < [_leavesArray count]; i++) {
        if (CGRectContainsPoint([_leavesArray[i] boundingBox], touchLocation)) {
            // change position of mouseJointNode
            _mouseJointNode.position = touchLocation;
            
            // set chosen block to CCNode
            CCNode *selected = (CCNode*)_leavesArray[i];
            
            // setup joint
            _mouseJoint = [CCPhysicsJoint connectedPivotJointWithBodyA:_mouseJointNode.physicsBody bodyB:selected.physicsBody anchorA:ccp(0, 0)];
            
            // check what block was touched
            CCLOG(@"Touching block node #%d", i);
            
            // stop search
            break;
        }
    }
}

- (void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // change position of mouseJointNode
    _mouseJointNode.position = touchLocation;
}


-(void) touchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    [self releaseLeaf];
}

-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    [self releaseLeaf];
}

// mouseJoint = nil once released
- (void)releaseLeaf {
    if (_mouseJoint != nil)
    {
        // releases the joint and lets the catapult snap back
        [_mouseJoint invalidate];
        _mouseJoint = nil;
    }
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
        [_leavesArray addObject:test];
        
    }
}

@end
