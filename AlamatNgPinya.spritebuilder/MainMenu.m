/*
 * Notes:
 *  - Dire lang i-add ang functions for "Swipe to start", "More Games" ug ang particle effect sa touch
 *  - Implementation sa touches ug ang initial na values will be 
 */

#import "MainMenu.h"

@implementation MainMenu

-(void)page1 {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"pages/Page1"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
