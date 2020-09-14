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
     userToken: String = null) {
        PianoComposerModule.execute(aid, sandbox, tags, zoneID, referrer, url, customVariables, userToken);
    }
}

export default PianoComposer;
