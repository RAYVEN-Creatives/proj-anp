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
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page1
    CCLOG(@"Page 1 loaded.");
    
    // disable collision on mouseNode
    //_mouseNode.physicsBody.collisionMask = @[];
    
    
    // as a starting point, leaves fall
    [self fallLeaves];
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    // TODO: Find much better way than getting three collision boxes' status
    
    // gets touch location
    CGPoint touchLocation = [touch locationInWorld];
   
    // drop leaves ~~
    [self leafMovement:&touchLocation];
}


// Drop leaves on tree upon clicking the tree
// TODO: Make the tree shake
-(void) leafMovement:(CGPoint *) touchLocation {
    Boolean touchLeaf = CGRectContainsPoint([_leafbulkNode boundingBox], *touchLocation);
    Boolean touchTrunk = CGRectContainsPoint([_trunkNode boundingBox], *touchLocation);
    
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

-(void) nextPage {
    CCLOG(@"Next page");
    // shift pages to page2
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page2"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
