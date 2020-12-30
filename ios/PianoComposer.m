#import "PianoComposer.h"

@import PianoComposer;


@interface RNPianoComposer (PianoDelegate) <PianoComposerDelegate, PianoShowTemplateDelegate>
@end


@implementation RNPianoComposer

@synthesize eventParameters;
@synthesize showLoginHandler;
@synthesize showTemplateHandler;
@synthesize presentTemplateController;


BOOL _hasListeners;
static NSString *eventName = @"PIANO_LISTENER";
static const float popViewPreferredWidth = 600;
static const float popViewPreferredHeight = 730;


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
    [self setEventParameters:[NSMutableDictionary new]];
    [self setShowLoginHandler:showLoginHandler];
    [self setShowTemplateHandler:showTemplateHandler];
    
    PianoComposer *composer = [[PianoComposer alloc] initWithAid:AID sandbox:sandbox];
    [composer setDelegate:self];
    
    if(tags.count > 0) {
        for (id tag in tags) {
            if ([tag isEqual:[NSNull null]]) {
                @throw @"RNPianoComposer: While calling [PianoComposer \
                executeWithAID:sandbox:tags:...] All values of tags must not be NSNull";
            }
        }
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

RCT_EXPORT_METHOD(closeTemplateController) {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.presentTemplateController close];
    });
}

- (NSArray<NSString *> *)supportedEvents {
    return @[eventName];
}

- (void)startObserving {
  _hasListeners = YES;
}

- (void)stopObserving {
  _hasListeners = NO;
}


#pragma mark - piano delegate

-(void)showLoginWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowLoginEventParams *)params {
    if (self.showLoginHandler != nil) {
        self.showLoginHandler(@[self.eventParameters]);
    }
}

-(void)showTemplateWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ShowTemplateEventParams *)params {
    
    [self.eventParameters setObject:@(params.showCloseButton) forKey:@"showCloseButton"];
    
    [params setShowCloseButton:false]; // Workaround to fix showCloseButton issue in Piano SDK
    PianoShowTemplatePopupViewController *showTemplate = [[PianoShowTemplatePopupViewController alloc] initWithParams:params];
    if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
    {
        [showTemplate setPreferredContentSize:CGSizeMake(popViewPreferredWidth, popViewPreferredHeight)];
    }
    [self setPresentTemplateController:showTemplate];
    [showTemplate setDelegate:self];
    [showTemplate show];
    
    if (self.showTemplateHandler != nil) {
        self.showTemplateHandler(@[self.eventParameters]);
    }
}

-(void)userSegmentTrueWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
}

-(void)userSegmentFalseWithComposer:(PianoComposer *)composer event:(XpEvent *)event {
}

-(void)meterActiveWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
    
    [self.eventParameters setObject:params.meterName forKey:@"meterName"];
    [self.eventParameters setObject:@(params.views) forKey:@"views"];
    [self.eventParameters setObject:@(params.viewsLeft) forKey:@"viewsLeft"];
    [self.eventParameters setObject:@(params.maxViews) forKey:@"maxViews"];
    [self.eventParameters setObject:@(params.totalViews) forKey:@"totalViews"];
}

-(void)meterExpiredWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(PageViewMeterEventParams *)params {
    [self.eventParameters setObject:params.meterName forKey:@"meterName"];
    [self.eventParameters setObject:@(params.views) forKey:@"views"];
    [self.eventParameters setObject:@(params.viewsLeft) forKey:@"viewsLeft"];
    [self.eventParameters setObject:@(params.maxViews) forKey:@"maxViews"];
    [self.eventParameters setObject:@(params.totalViews) forKey:@"totalViews"];
}

-(void)experienceExecuteWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(ExperienceExecuteEventParams *)params {
}

-(void)experienceExecutionFailedWithComposer:(PianoComposer *)composer event:(XpEvent *)event params:(FailureEventParams *)params {
}

-(void)composerExecutionCompletedWithComposer:(PianoComposer *)composer {
}


#pragma mark - piano show template delegate

-(void)onRegisterWithEventData:(id)eventData {
    [self sendEventWithName:eventName body:@{
        @"eventName": @"templateCustomEvent",
        @"eventData": @{@"eventName": @"register"}
    }];
}

-(void)onLoginWithEventData:(id)eventData {
    [self sendEventWithName:eventName body:@{
        @"eventName": @"templateCustomEvent",
        @"eventData": @{@"eventName": @"login"}
    }];
}

-(void)onCustomEventWithEventData:(id)eventData {
    [self sendEventWithName:eventName body:@{
        @"eventName": @"templateCustomEvent",
        @"eventData": @{@"eventName": eventData[@"eventName"]}
    }];
}

@end


