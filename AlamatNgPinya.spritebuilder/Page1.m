//
//  Page1.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page1.h"

@implementation Page1

{
    CCNode *_leavesNode;
    CCNode *_branchNode;
    CCNode *_trunkNode1;
    CCNode *_trunkNode2;
}

- (void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // test if page 1 will come out here
    CCLOG(@"Page 1 loaded.");
    
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
    Boolean touchBranch = CGRectContainsPoint([_branchNode boundingBox], *touchLocation);
    Boolean touchTrunk1 = CGRectContainsPoint([_trunkNode1 boundingBox], *touchLocation);
    Boolean touchTrunk2 = CGRectContainsPoint([_trunkNode2 boundingBox], *touchLocation);
    
    if (touchBranch || touchTrunk1 || touchTrunk2) {
        [self fallLeaves];
    }
}

-(void) fallLeaves {
    CCLOG(@"Leaves fall off...");
    // load leaves
    CCParticleSystem *leaves = (CCParticleSystem *)[CCBReader load:@"assets/ccbFiles/FallingLeaves"];
    
    // position leaves above (change points to corresponds with the tree's location)
    leaves.position = ccp(50, 320);
    
    // throws/falls leaves
    [_leavesNode.parent addChild:leaves];
}

@end
