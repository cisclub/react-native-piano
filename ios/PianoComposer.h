#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RNPianoComposer : RCTEventEmitter <RCTBridgeModule>

@property (nonatomic, strong) NSMutableDictionary *eventParameters;

@end

