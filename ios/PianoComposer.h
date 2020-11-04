#import <React/RCTBridgeModule.h>

@interface RNPianoComposer : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTResponseSenderBlock showLoginHandler;
@property (nonatomic, strong) RCTResponseSenderBlock showTemplateHandler;

@end
