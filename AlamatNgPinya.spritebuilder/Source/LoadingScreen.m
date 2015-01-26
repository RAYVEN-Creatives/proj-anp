#import "LoadingScreen.h"

@implementation LoadingScreen

// BUG: Need to find a way to remove THAT dummy button.

// for dummy button

-(void)toMainMenu {
<<<<<<< Updated upstream
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Menu"];
=======
    CCLOG(@"Does this thing work? = =");
    CCScene *gameplayScene = [CCBReader loadAsScene:@"MainMenu"];
>>>>>>> Stashed changes
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}
/*
// for working button
-(void)play {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Menu"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}
 */

@end
