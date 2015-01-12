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
    CCNode *_testNode;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 4 loaded.");
    
    // TEST: Fading a node
    [self sampleFade];
}

-(void) sampleFade {
    _testNode.opacity = 0.50f;
}

@end
