#import "PianoComposer.h"

@import PianoComposer;

@interface RNPianoComposer (PianoDelegate) <PianoComposerDelegate>

@end

@implementation RNPianoComposer

@synthesize showLoginHandler;

RCT_EXPORT_MODULE(PianoComposer)

RCT_EXPORT_METHOD(
                  executeWithAID:(NSString *)AID
                  sandbox:(BOOL)sandbox
                  tags:(nullable NSSet *)tags
                  zoneID:(nullable NSString *)zoneID
                  referrer:(nullable NSString *)referrer
                  url:(nullable NSString *)url
                  contentAuthor:(nullable NSString *)contentAuthor
                  contentCreated:(nullable NSString *)contentCreated
                  contentSection:(nullable NSString *)contentSection
                  customVariables:(nullable NSDictionary *)customnVariables
                  userToken:(nullable NSString *)userToken
                  showLoginHandler:(RCTResponseSenderBlock)showLoginHandler
                  showTemplateHandler:(RCTResponseSenderBlock)showTemplateHandler
                  )
{
    PianoComposer *composer = [[PianoComposer alloc] initWithAid:AID sandbox:sandbox];
    
    [self setShowLoginHandler:showLoginHandler];
    [self setShowTemplateHandler:showTemplateHandler];
    
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
    
    if (contentAuthor != nil) {
        [composer setContentAuthor:contentAuthor];
    }
       
    if (contentCreated != nil) {
        [composer setContentCreated:contentCreated];
    }
       
    if (contentSection != nil) {
        [composer setContentSection:contentSection];
    }
    
    [composer execute];
}

#pragma mark - piano delegate

-(void)showLoginWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowLoginEventParams *)params {
    self.showLoginHandler(@[]);
}

-(void)showTemplateWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowTemplateEventParams *)params {
    PianoShowTemplateController *showTemplate = [[PianoShowTemplateController alloc] initWithParams:params];
    [showTemplate show];
    self.showTemplateHandler(@[]);
}

-(void)userSegmentTrueWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
}

-(void)userSegmentFalseWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
}

-(void)meterActiveWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
}

-(void)meterExpiredWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
}

-(void)experienceExecuteWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ExperienceExecuteEventParams *)params {
}

-(void)experienceExecutionFailedWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(FailureEventParams *)params {
}

-(void)composerExecutionCompletedWithComposer:(PianoComposer *)composer {
}


@end
