//
//  Page3.m
//  PhysicsTest
//
//  Created by Ray Venenoso on 1/5/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Page3.h"

@implementation Page3
{
    int blanketTap;
    int curtainLeftTap;
    int curtainRightTap;
    CCNode *_blanketNode;
    CCNode *_curtainLeftNode;
    CCNode *_curtainRightNode;
    CCSprite *_bedSprite;
    CCSprite *_curtainLeftSprite;
    CCSprite *_curtainRightSprite;
}

-(void) didLoadFromCCB {
    // enable touch inputs
    self.userInteractionEnabled = TRUE;
    
    // load page3
    CCLOG(@"Page 3 loaded.");
    
    // move animation by tap count
    blanketTap = 0;
    curtainLeftTap = 0;
    curtainRightTap = 0;
    
    // init: covers blanket on the first scene
    [self move:_bedSprite detector:_blanketNode sequence:@"CoverBlanket" counter:0 status:-1 maxscale:2.50];
    
}

-(void) touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event {
    CGPoint touchLocation = [touch locationInWorld];
    [self detectTouch:&touchLocation];
}

// traces touch positions
-(void) detectTouch:(CGPoint *) touchLocation {
    // if it touches the blanket
    if (CGRectContainsPoint([_blanketNode boundingBox], *touchLocation)) {
        blanketTap = [self moveShift:_bedSprite detector:_blanketNode counter:blanketTap scene1:@"UncoverBlanket" scene2:@"CoverBlanket" maxscale:2.50];
    }
    // else if it touches the left curtain
    else if (CGRectContainsPoint([_curtainLeftNode boundingBox], *touchLocation)) {
        curtainLeftTap = [self moveCurtain:_curtainLeftSprite detector:_curtainLeftNode counter:curtainLeftTap];
    }
    // else if it touches the right curtain
    else if (CGRectContainsPoint([_curtainRightNode boundingBox], *touchLocation)) {
        curtainRightTap = [self moveCurtain:_curtainRightSprite detector:_curtainRightNode counter:curtainRightTap];
    }
}

// FOR CURTAINS ONLY: simplify code..
-(int) moveCurtain:(CCSprite *)position detector:(CCNode *)detect counter:(int) count {
    count = [self moveShift:position detector:detect counter:count scene1:@"OpenCurtain" scene2:@"CloseCurtain" maxscale:1.50];
    return count;
}

// shifts the scene of the sprite according to tap count
-(int) moveShift:(CCSprite *)sprite detector:(CCNode *)detect counter:(int)count scene1:(NSString *)s1 scene2:(NSString *)s2 maxscale:(float)max{
    // check current scene
    NSString *scene;
    if (count % 2 == 0) scene = [NSString stringWithString:s1];
    else scene = [NSString stringWithString:s2];
    // call move function
    return [self move:sprite detector:detect sequence:scene counter:count status:count%2 maxscale:max];
}

// activates animation by running the sequence...
-(int) move:(CCSprite *)sprite detector:(CCNode *)detect sequence:(NSString *)scene counter:(int)count status:(int)stat maxscale:(float)max {
    // activate animation by scene
    [sprite.animationManager runAnimationsForSequenceNamed: scene];
    // shrinks detector according to sprite size, if existed
    if (stat == 0) detect.scaleX = 0.15; else detect.scaleX = max;
    return count+1;
}

@end
