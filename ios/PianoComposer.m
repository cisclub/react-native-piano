#import "PianoComposer.h"

@import PianoComposer;

@interface RNPianoComposer (PianoDelegate) <PianoComposerDelegate>

@end

@implementation RNPianoComposer

@synthesize showLoginHandler;
@synthesize showTemplateHandler;
@synthesize userSegmentTrueHandler;
@synthesize userSegmentFalseHandler;
@synthesize meterActiveHandler;
@synthesize meterExpiredHandler;
@synthesize experienceExecuteHandler;
@synthesize experienceExecutionFailedHandler;
@synthesize composerExecutionCompleteHandler;

RCT_EXPORT_MODULE(PianoComposer)

RCT_EXPORT_METHOD(
                  executeWithAID:(NSString *)AID
                  sandbox:(BOOL)sandbox
                  tags:(nullable NSSet *)tags
                  zoneID:(nullable NSString *)zoneID
                  referrer:(nullable NSString *)referrer
                  url:(nullable NSString *)url
                  customVariables:(nullable NSDictionary *)customnVariables
                  userToken:(nullable NSString *)userToken
                  showLoginHandler:(RCTResponseSenderBlock)showLoginHandler
                  showTemplateHandler:(RCTResponseSenderBlock)showTemplateHandler
                  userSegmentTrueHandler:(RCTResponseSenderBlock)userSegmentTrueHandler
                  userSegmentFalseHandler:(RCTResponseSenderBlock)userSegmentFalseHandler
                  meterActiveHandler:(RCTResponseSenderBlock)meterActiveHandler
                  meterExpiredHandler:(RCTResponseSenderBlock)meterExpiredHandler
                  experienceExecuteHandler:(RCTResponseSenderBlock)experienceExecuteHandler
                  experienceExecutionFailedHandler:(RCTResponseSenderBlock)experienceExecutionFailedHandler
                  composerExecutionCompleteHandler:(RCTResponseSenderBlock)composerExecutionCompleteHandler
                  )
{
    PianoComposer *composer = [[PianoComposer alloc] initWithAid:AID sandbox:sandbox];
    
    [composer setDelegate:self];
    
    if(tags.count > 0) {
        [composer setTags:tags];
    }
    if(zoneID != nil) {
        [composer setZoneId:zoneID];
    }
    if(referrer != nil) {
        [composer setReferrer:referrer];
    }
    if(url != nil) {
        [composer setUrl:url];
    }
    if(customnVariables != nil) {
        [composer setCustomVariables:customnVariables];
    }
    if(userToken != nil) {
        [composer setUserToken:userToken];
    }
    
    [composer execute];
}

#pragma mark - piano delegate

-(void)showLoginWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowLoginEventParams *)params {
    self.showLoginHandler(nil);
}

-(void)showTemplateWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowTemplateEventParams *)params {
    self.showTemplateHandler(nil);
}

-(void)userSegmentTrueWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
    self.userSegmentTrueHandler(nil);
}

-(void)userSegmentFalseWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
    self.userSegmentFalseHandler(nil);
}

-(void)meterActiveWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
    self.meterActiveHandler(nil);
}

-(void)meterExpiredWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
    self.meterExpiredHandler(nil);
}

-(void)experienceExecuteWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ExperienceExecuteEventParams *)params {
    self.experienceExecuteHandler(nil);
}

-(void)experienceExecutionFailedWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(FailureEventParams *)params {
    self.experienceExecutionFailedHandler(nil);
}

-(void)composerExecutionCompletedWithComposer:(PianoComposer *)composer {
    self.composerExecutionCompleteHandler(nil);
}


@end
