#include <debugapi.h>
#include <stdio.h>
#include <openvr.h>

int main() {
  char debug_string[1024];
  vr::EVRInitError error = vr::VRInitError_Init_NotInitialized;
  
  snprintf(debug_string, sizeof(debug_string), "ovr_Initialize(...): calling\n");
  OutputDebugString(debug_string);
  puts(debug_string);

  vr::IVRSystem* ptr = vr::VR_Init(&error, vr::VRApplication_Scene);

  snprintf(debug_string, sizeof(debug_string), "ovr_Initialize(...): returned error %d and object %p\n", error, ptr);
  OutputDebugString(debug_string);
  puts(debug_string);

  vr::VR_Shutdown();
  
  return error;  // vr::VRInitError_None == 0
}  
