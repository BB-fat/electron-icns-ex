// Copyright 2021 alexju
#ifndef ELECTRON_ICNS_EX_ICNS_H_
#define ELECTRON_ICNS_EX_ICNS_H_

#include <string>

std::string ParseIcnsToBase64(const std::string &path);

void ParseIcnsToPNG(const std::string &icnsPath, const std::string &pngPath);

#endif  //ELECTRON_ICNS_EX_ICNS_H_
