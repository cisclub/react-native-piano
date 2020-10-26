import { NativeModules } from 'react-native';

const PianoComposerModule = NativeModules.PianoComposer;

const PianoComposer = {
    execute(aid: String,
    sandbox: bool = true,
    tags: Array = null,
    zoneID: String = null,
    referrer: String = null,
    url: String = null,
    customVariables: Dictionary = null,
    userToken: String = null,
    showLoginHandler = () => {},
    showTemplateHandler = () => {},
    userSegmentTrueHandler = () => {},
    userSegmentFalseHandler = () => {},
    meterActiveHandler = () => {},
    meterExpiredComposer = () => {},
    experienceExecuteHandler = () => {},
    experienceExecutionFailedHandler = () => {},
    composerExecutionCompletedHandler = () => {}
    ) {
        PianoComposerModule.executeWithAID(
            aid,
            sandbox,
            tags,
            zoneID,
            referrer,
            url,
            customVariables,
            userToken,
            showLoginHandler,
            showTemplateHandler,
            userSegmentTrueHandler,
            userSegmentFalseHandler,
            meterActiveHandler,
            meterExpiredComposer,
            experienceExecuteHandler,
            experienceExecutionFailedHandler,
            composerExecutionCompletedHandler
            );
    }
}

export default PianoComposer;
