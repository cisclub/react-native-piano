#import "PianoComposer.h"

@import PianoComposer;

@implementation RNPianoComposer

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(executeWithAID:(NSString *)AID
                  sandbox:(BOOL)sandbox
                  tags:(nullable NSSet *)tags
                  zoneID:(nullable NSString *)zoneID
                  referrer:(nullable NSString *)referrer
                  url:(NSString *)url
                  customVariables:(NSDictionary *)customnVariables
                  userToken:(NSString *)userToken)
{
    PianoComposer *composer = [[PianoComposer alloc] initWithAid:AID sandbox:sandbox];
    
    if(tags != nil) {
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

@end
