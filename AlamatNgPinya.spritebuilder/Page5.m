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
    CCNode *_blockNode1;
    CCNode *_blockNode2;
    CCNode *_blockNode3;
    CCNode *_blockNode4;
    CCNode *_blockNode5;
    CCNode *_mouseJointNode;
    CCPhysicsJoint *_mouseJoint;
    CCPhysicsNode *_physicsNode;
    NSArray *_blocksArray;
}

- (void) didLoadFromCCB {
    // enable touch input
    self.userInteractionEnabled = TRUE;
    
    // DEBUG: enable physics debug mode
    _physicsNode.debugDraw = TRUE;
    
    // add blocks to array
    _blocksArray = [NSArray arrayWithObjects:_blockNode1, _blockNode2, _blockNode3, _blockNode4, _blockNode5,nil];
    
    // overlap node with block sprite
    for(int i = 0; i < [_blocksArray count]; i++) {
        CCSprite *test = (CCSprite*) [CCBReader load: @"assets/ccbFiles/Block"];
        [_blocksArray[i] addChild:test];
    }
    
    // disable collision of mouseJointNode
    _mouseJointNode.physicsBody.collisionMask =@[];
    
    // notice
    CCLOG(@"Page 5 loaded.");
}

- (void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // get touch location
    CGPoint touchLocation = [touch locationInWorld];
    
    // check if touch is within the blocks
    for(int i = 0; i < [_blocksArray count]; i++) {
        if (CGRectContainsPoint([_blocksArray[i] boundingBox], touchLocation)) {
            // change position of mouseJointNode
            _mouseJointNode.position = touchLocation;
            
            // set chosen block to CCNode
            CCNode *selected = (CCNode*)_blocksArray[i];
            
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
    [self releaseBlock];
}

-(void) touchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    [self releaseBlock];
}

// mouseJoint = nil once released
- (void)releaseBlock {
    if (_mouseJoint != nil)
    {
        // releases the joint and lets the catapult snap back
        [_mouseJoint invalidate];
        _mouseJoint = nil;
    }
}


// add blocks to screen
- (void) addBlocks {
    
    //_blocksArray = [NSArray arrayWithObjects: _block1, _block2, _block3, _block4, _block5, nil];
}

@end
