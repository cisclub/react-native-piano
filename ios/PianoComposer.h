#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNPianoComposer : RCTEventEmitter <RCTBridgeModule>

@property (nonatomic, strong) NSMutableDictionary *eventParameters;
@property (nonatomic, strong) RCTResponseSenderBlock showLoginHandler;
@property (nonatomic, strong) RCTResponseSenderBlock showTemplateHandler;
@property (nonatomic, strong) id presentTemplateController;

@end

