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
    
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 4 loaded.");
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CCLOG(@"Test burn effects...");
    
    // load effect
    CCSprite *burneffect = (CCSprite *) [CCBReader load:@"props/BurnEffect"];
    
    // position
    burneffect.position = ccp(300, 150);
    
    // addchild
    
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
