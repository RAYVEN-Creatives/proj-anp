//
//  Gameplay.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Gameplay.h"

@implementation Gameplay

{
    CCNode *_pageNode;
    int pnum;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // add page 1 first
    CCScene *test = (CCScene *)[CCBReader load:@"pages/Page1"];
    [_pageNode addChild:test];
    
    // define pageNum
    pnum = 1;
}

// go to next page
- (void) prevPage {
    pnum--;
    [self shiftPage:pnum];
}

// go to previous page
- (void) nextPage {
    pnum++;
    [self shiftPage:pnum];
}

// shift page screen to Page p
- (void) shiftPage: (int) p {
    // returns if current page = start/end page (max page = 12)
    // note: can change scenes using this part
    if (p < 1) {
        pnum = 1;
        [self toMainMenu];
        return;
    } else if (p > 12) {
        pnum = 12;
        [self toMainMenu];
        return;
    }
    
    // remove all child
    [_pageNode removeAllChildren];
    
    // change page
    // make string
    NSString *pageNum = [NSString stringWithFormat:@"%d", p];
    NSString *pagePath = [NSString stringWithFormat:@"pages/Page"];
    
    // concatenate with page #
    NSString *pageName =[pagePath stringByAppendingString:pageNum];
    CCScene *page = (CCScene *)[CCBReader load:pageName];
    
    // add to child
    [_pageNode addChild:page];
}

- (void) toMainMenu {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
