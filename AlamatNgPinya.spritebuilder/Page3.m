//
//  Page3.m
//  AlamatNgPinya
//
//  Created by Ray Venenoso on 1/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page3.h"

@implementation Page3

{
    int curtainTap;
    CCNode *_curtainNode;
    CCSprite *_curtainSprite;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 3 loaded.");
    
    curtainTap = 0;
    
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInWorld];
    curtainTap = [self moveCurtain:curtainTap scene1:@"Close Curtain" scene2:@"Open Curtain" location:&touchLocation];
}

// shifts the scene of the sprite according to tap count
-(int) moveCurtain:(int)count scene1:(NSString*)s1 scene2:(NSString*)s2 location:(CGPoint*)loc {
    
    // close? or open? (0/1)
    BOOL close = (count % 2 == 0);
    
    // check current scene
    NSString *scene;
    if (close) scene = [NSString stringWithString:s1];
    else scene = [NSString stringWithString:s2];
    
    // change sprite
    [_curtainSprite.animationManager runAnimationsForSequenceNamed: scene];
    
    // shrink/expand detector
    if (close) _curtainNode.scaleX = 1.30;
    else _curtainNode.scaleX = 0.35;
    
    // return new value
    return count+1;
}

@end
