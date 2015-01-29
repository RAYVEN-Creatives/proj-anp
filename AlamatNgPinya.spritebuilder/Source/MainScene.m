#import "MainScene.h"

@implementation MainScene

- (void) play {
    CCScene *gameplayScene = [CCBReader loadAsScene:@"Gameplay"];
    [[CCDirector sharedDirector] replaceScene:gameplayScene];
}

@end
