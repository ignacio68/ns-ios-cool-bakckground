import { NativeScriptConfig } from '@nativescript/core';

export default {
  id: 'org.nativescript.nscoolbkackground',
  appPath: 'src',
  appResourcesPath: 'App_Resources',
  android: {
    v8Flags: '--expose_gc',
    markingMode: 'none'
  }
} as NativeScriptConfig;