#import <React/RCTBridgeModule.h>

@interface RNPianoComposer : NSObject <RCTBridgeModule>

@property (nonatomic, strong) RCTResponseSenderBlock showLoginHandler;
@property (nonatomic, strong) RCTResponseSenderBlock showTemplateHandler;
@property (nonatomic, strong) RCTResponseSenderBlock userSegmentTrueHandler;
@property (nonatomic, strong) RCTResponseSenderBlock userSegmentFalseHandler;
@property (nonatomic, strong) RCTResponseSenderBlock meterActiveHandler;
@property (nonatomic, strong) RCTResponseSenderBlock meterExpiredHandler;
@property (nonatomic, strong) RCTResponseSenderBlock experienceExecuteHandler;
@property (nonatomic, strong) RCTResponseSenderBlock experienceExecutionFailedHandler;
@property (nonatomic, strong) RCTResponseSenderBlock composerExecutionCompleteHandler;

@end
