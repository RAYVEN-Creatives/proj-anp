//
//  Page1.m
//  PhysicsTest
//
//  Created by Ray Venenoso on 12/11/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Page1.h"

@implementation Page1

{
    CCNode *_leavesNode;
    CCNode *_leafbulkNode;
    CCNode *_trunkNode;
    CCNode *_branchNode;
    CCNode *_broomNode;
    CCNode *_mouseNode;
    CCPhysicsNode *_physicsNodep1;
    CCPhysicsJoint *_mouseJoint;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page1
    CCLOG(@"Page 1 loaded.");
    
    // disable collision on mouseNode
    _mouseNode.physicsBody.collisionMask = @[];
    
    // DEBUG: Let's see le joints ~
    // _physicsNodep1.debugDraw = TRUE;
    
    // as a starting point, leaves fall
    [self fallLeaves];
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // TODO: Find much better way than getting three collision boxes' status
    
    // gets touch location
    CGPoint touchLocation = [touch locationInWorld];

    if (CGRectContainsPoint([_broomNode boundingBox], touchLocation)){
        CCLOG(@"Start...");
        // move broom ~~
        [self holdBroom:&touchLocation];
    }
    
    // drop leaves ~~
    [self leafMovement:&touchLocation];
}

-(void) touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event {

    CGPoint touchLocation = [touch locationInWorld];
    
    // change location of broom using mouse position
    _broomNode.position = touchLocation;
}

-(void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [self releaseBroom];
}

-(void)touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    [self releaseBroom];
}

-(void) holdBroom:(CGPoint *) touchLocation {
    // move location of mouseNode
    _mouseNode.position = *touchLocation;
    
    // add joint to mouse and broom
    _mouseJoint = [CCPhysicsJoint connectedDistanceJointWithBodyA:_broomNode.physicsBody bodyB:_mouseNode.physicsBody anchorA:ccp(100, 100) anchorB:ccp(1, 1) minDistance:0.01 maxDistance:0.01];
}

-(void) releaseBroom {
    if (_mouseJoint != nil) {
        // release broom
        [_mouseJoint invalidate];
        _mouseJoint = nil;
    }
}

// Drop leaves on tree upon clicking the tree
// TODO: Make the tree shake
-(void) leafMovement:(CGPoint *) touchLocation {
    Boolean touchLeaf = CGRectContainsPoint([_leafbulkNode boundingBox], *touchLocation);
    Boolean touchTrunk = CGRectContainsPoint([_trunkNode boundingBox], *touchLocation);
    //Boolean touchBranch = CGRectContainsPoint([_branchNode boundingBox], *touchLocation);
    
    if (touchLeaf || touchTrunk) {
        [self fallLeaves];
    }
}

-(void) fallLeaves {
    CCLOG(@"Leaves fall off...");
    // load leaves
    CCParticleSystem *leaves = (CCParticleSystem *)[CCBReader load:@"props/particles/LeafParticle"];
    
    // position leaves above (change points to corresponds with the tree's location)
    leaves.position = ccp(50, 320);
    
    // throws/falls leaves
    [_leavesNode.parent addChild:leaves];
}

// next/prev pages
-(void) nextPage {
    CCLOG(@"Next page");
    // shift pages to page2
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page2"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
