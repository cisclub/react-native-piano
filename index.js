import { NativeEventEmitter, NativeModules } from 'react-native';

const PianoComposerModule = NativeModules.PianoComposer;
const eventEmitter = new NativeEventEmitter(PianoComposerModule)

const PianoComposer = {
    execute(aid: String,
    sandbox: bool = true,
    tags: Array = null,
    zoneID: String = null,
    referrer: String = null,
    url: String = null,
    contentAuthor: String = null,
    contentCreated: String = null,
    contentSection: String = null,
    customVariables: Dictionary = null,
    userToken: String = null,
    showLoginHandler = () => {},
    showTemplateHandler = () => {}
    ) {
        PianoComposerModule.executeWithAID(
            aid,
            sandbox,
            tags,
            zoneID,
            referrer,
            url,
            contentAuthor,
            contentCreated,
            contentSection,
            customVariables,
            userToken,
            showLoginHandler,
            showTemplateHandler
            );
    },

    closeTemplateController() {
        PianoComposerModule.closeTemplateController()
    },

    addEventListener(eventName, callback = () => {}) {
        const subscribe = eventEmitter.addListener(eventName, callback);
        return subscribe
    },

    removeEventListener(eventName) {
        eventEmitter.removeAllListeners(eventName);
    }
}

export default PianoComposer;
