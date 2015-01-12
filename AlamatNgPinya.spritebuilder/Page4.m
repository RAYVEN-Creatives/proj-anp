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
    CCSprite *_testNode;
    CCPhysicsNode *_physicsNode;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 4 loaded.");
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {

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
