# Overview

When OpenVR's `VR_Init` is called from a 32bit Windows binary on a 64bit Linux machine, it either crashes or
returns a huge number for the error code and 0 for the API table.

Included in this repo is a [basic C++ program](test.cpp) that calls `VR_Init` to demo this. It works fine when
built as a 64bit binary, but crashes under Proton 10 when build as a 32bit binary.


# Issue details

Calling `VR_Init` from a 32bit binary under Proton 10 results in a crash

```
...
2805317.001:0188:018c:trace:loaddll:build_module Loaded L"C:\\vrclient\\bin\\vrclient.dll" at 7A9D0000: builtin
2805317.001:0188:018c:trace:vrclient:DllMain (7A9D0000, 1, 00000000)
2805317.001:0188:018c:trace:vrclient:VRClientCoreFactory name: IVRClientCore_003, return_code: 0080FA8C
2805317.011:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\rpcrt4.dll" at 7A850000: builtin
2805317.011:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\setupapi.dll" at 7A8F0000: builtin
2805317.012:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\winevulkan.dll" at 7A980000: builtin
2805317.012:0188:018c:trace:vrclient:load_vrclient got openvr runtime path: /home/tyson/.local/share/Steam/steamapps/common/SteamVR/bin/vrclient.so
2805317.019:0188:018c:trace:vrclient:get_winevulkan_unixlib path /home/tyson/.local/share/Steam/steamapps/common/Proton 10.0/files/lib/wine/i386-unix/winevulkan.so.
2805317.019:0188:018c:trace:vrclient:create_win_interface trying to create IVRClientCore_003
2805317.019:0188:018c:trace:vrclient:create_winIVRClientCore_IVRClientCore_003 -> 0082BD68
2805317.019:0188:018c:warn:seh:dispatch_exception backtrace: --- Exception 0xc0000005.
2805317.019:0188:018c:trace:seh:dispatch_exception code=c0000005 (EXCEPTION_ACCESS_VIOLATION) flags=0 addr=7BB41900
2805317.019:0188:018c:trace:seh:dispatch_exception  info[0]=00000001
2805317.019:0188:018c:trace:seh:dispatch_exception  info[1]=0000000A
2805317.019:0188:018c:trace:seh:dispatch_exception eip=7bb41900 esp=0080fa00 ebp=0080fa90 eflags=00010287
2805317.019:0188:018c:trace:seh:dispatch_exception eax=00000001 ebx=0080fae0 ecx=0000000f edx=fffffffe
2805317.019:0188:018c:trace:seh:dispatch_exception esi=00000000 edi=00000010 cs=0023 ds=002b es=002b fs=0063 gs=006b ss=002b
2805317.019:0188:018c:trace:seh:call_seh_handlers calling handler at 7BF696B0 code=c0000005 flags=0
2805317.019:0188:018c:trace:seh:signal (11, 00000000)
wine: Unhandled page fault on write access to 0000000A at address 7BB41900 (thread 018c), starting debugger...
...
System information:
    Wine build: wine-10.0
    Platform: x86_64 (guest: i386)
    Version: Windows 10
    Host system: Linux
    Host version: 6.12.4
...
```
while calling it from a 64bit does not
```
...
2805459.898:020c:0210:trace:loaddll:build_module Loaded L"C:\\vrclient\\bin\\vrclient_x64.dll" at 00006FFFFD9D0000: builtin
2805459.899:020c:0210:trace:vrclient:DllMain (00006FFFFD9D0000, 1, 0000000000000000)
2805459.899:020c:0210:trace:vrclient:VRClientCoreFactory name: IVRClientCore_003, return_code: 000000000022FA50
2805459.903:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\rpcrt4.dll" at 00006FFFFF900000: builtin
2805459.903:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\setupapi.dll" at 00006FFFFF870000: builtin
2805459.903:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\winevulkan.dll" at 00006FFFFDC00000: builtin
2805459.903:020c:0210:trace:vrclient:load_vrclient got openvr runtime path: /home/tyson/.local/share/Steam/steamapps/common/SteamVR/bin/linux64/vrclient.so
2805459.903:020c:0210:trace:vrclient:get_winevulkan_unixlib path /home/tyson/.local/share/Steam/steamapps/common/Proton 10.0/files/lib/wine/x86_64-unix/winevulkan.so.
2805459.903:020c:0210:trace:vrclient:create_win_interface trying to create IVRClientCore_003
2805459.903:020c:0210:trace:vrclient:create_winIVRClientCore_IVRClientCore_003 -> 00000000002A39B0
2805459.903:020c:0210:trace:vrclient:winIVRClientCore_IVRClientCore_003_Init 00000000002A39B0
2805462.319:020c:0210:trace:vrclient:winIVRClientCore_IVRClientCore_003_IsInterfaceVersionValid 00000000002A39B0
2805462.321:020c:0210:trace:vrclient:winIVRClientCore_IVRClientCore_003_GetGenericInterface 00000000002A39B0
2805462.321:020c:0210:trace:vrclient:ivrclientcore_get_generic_interface 0x7f0c343752a8 000000014000A01E
2805462.321:020c:0210:trace:vrclient:create_win_interface trying to create IVRSystem_022
2805462.321:020c:0210:trace:vrclient:create_winIVRSystem_IVRSystem_022 -> 00000000002A3A70
...
```

My guess would be that there is an issue in the code that is supposed to interfacing data between the 32bit and
64bit sides due to difference in the size of types.


# Nix

Also included is a nix flake for building the test program as

* a 32bit windows executable (`nix build .#test32 -o test32`), and
* a 64bit windows executable (`nix build .#test64 -o test64`).
