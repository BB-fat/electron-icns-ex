// Copyright 2021 alexju
#include <napi.h>
#include "icns.h"

Napi::String ParseIcnsJs(const Napi::CallbackInfo &info) {
  Napi::Env env = info.Env();

  if (info.Length() < 1) {
    Napi::TypeError::New(env, "Expect 1 argument but got 0.")
            .ThrowAsJavaScriptException();
    return Napi::String::New(env, "");
  }

  auto path = info[0].As<Napi::String>();
  auto base64 = ParseIcns(path);
  auto result = Napi::String::New(env, base64);
  return result;
}

Napi::Object Init(Napi::Env env, Napi::Object exports) {
    exports.Set("parseIcnsSync", Napi::Function::New(env, ParseIcnsJs));
    return exports;
}

NODE_API_MODULE(icns, Init)
