/*
 * Notes:
 *  - Dire lang i-add ang functions for "Swipe to start", "More Games" ug ang particle effect sa touch
 *  - Implementation sa touches ug ang initial na values will be 
 */

#import "Menu.h"

<<<<<<< Updated upstream:AlamatNgPinya.spritebuilder/Menu.m
@implementation Menu
=======
@implementation MainMenu
{
    CCNode *_logoNode;
    CCButton *_startButton;
}

-(void) didLoadFromCCB {
    _startButton.enabled = FALSE;
    [self fade];
}

-(void)fade{
    //CCActionFadeIn *fadeIn = [CCActionFadeIn actionWithDuration:0.5]; // fade in
    //CCActionDelay *delay = [CCActionDelay actionWithDuration:0.1f]; // some delays...
    CCActionFadeOut *fadeOut = [CCActionFadeOut actionWithDuration:0.5f]; // fade out
    CCActionSequence *testAction = [CCActionSequence actionWithArray:@[fadeOut]]; // sequence them here
    [_logoNode runAction:testAction]; // connect sequence to node
    //_startButton.enabled = TRUE;
}
>>>>>>> Stashed changes:AlamatNgPinya.spritebuilder/MainMenu.m

-(void)page1 {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
