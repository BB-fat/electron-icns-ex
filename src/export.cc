// Copyright 2021 alexju
#include <napi.h>
#include "icns.h"

Napi::String ParseIcnsToBase64Js(const Napi::CallbackInfo &info) {
  Napi::Env env = info.Env();

  if (info.Length() < 1) {
    Napi::TypeError::New(env, "Expect 1 argument but got 0.")
            .ThrowAsJavaScriptException();
    return Napi::String::New(env, "");
  }

  auto path = info[0].As<Napi::String>();
  auto base64 = ParseIcnsToBase64(path);
  auto result = Napi::String::New(env, base64);
  return result;
}

void ParseIcnsToPNGJs(const Napi::CallbackInfo &info) {
  Napi::Env env = info.Env();

  if (info.Length() < 2) {
    Napi::TypeError::New(env, "Expect 2 arguments.").ThrowAsJavaScriptException();
    return;
  }

  auto icnsPath = info[0].As<Napi::String>();
  auto pngPath = info[1].As<Napi::String>();
  ParseIcnsToPNG(icnsPath, pngPath);
}

Napi::Object Init(Napi::Env env, Napi::Object exports) {
    exports.Set("parseIcnsToBase64Sync", Napi::Function::New(env, ParseIcnsToBase64Js));
    exports.Set("parseIcnsToPNGSync", Napi::Function::New(env, ParseIcnsToPNGJs));
    return exports;
}

NODE_API_MODULE(icns, Init)
