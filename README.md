# Overview

When OpenVR's `VR_Init` is called from a 32bit Windows binary on a 64bit Linux machine, it either crashes or
returns a huge number for the error code and 0 for the API table.

Included in this repo is a [basic C++ program](test.cpp) that calls `VR_Init` to demo this. It works fine when
built as a 64bit binary, but crashes under Proton 10 when build as a 32bit binary.


# 32bit binary log

```
MESA-INTEL: warning: Haswell Vulkan support is incomplete
2805298.643:0020:0148:trace:loaddll:free_modref Unloaded module L"C:\\windows\\system32\\wineopenxr.dll" : builtin
2805298.643:0020:0148:trace:loaddll:free_modref Unloaded module L"C:\\windows\\system32\\dxgi.dll" : native
2805298.643:0020:0148:trace:vrclient:initialize_vr_data Completed VR info initialization.
2805298.643:0020:0148:trace:vrclient:DllMain (00006FFFFDC40000, 0, 0000000000000000)
2805298.644:0020:0148:trace:loaddll:free_modref Unloaded module L"C:\\windows\\system32\\vrclient_x64.dll" : builtin
2805304.661:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
2805304.668:012c:0140:fixme:uiautomation:msaa_provider_GetPatternProvider Unimplemented patternId 10002
2805304.668:012c:0140:fixme:uiautomation:base_hwnd_provider_GetPatternProvider 00000000002E7460, 10002, 000000000182F8A0: stub
2805304.673:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
2805309.922:012c:0140:fixme:uiautomation:msaa_provider_GetPatternProvider Unimplemented patternId 10002
2805309.922:012c:0140:fixme:uiautomation:base_hwnd_provider_GetPatternProvider 00000000002E8DF0, 10002, 000000000182F8A0: stub
2805309.927:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32768"
2805316.658:0188:018c:trace:loaddll:build_module Loaded L"Z:\\home\\tyson\\issue-proton-vrinit\\test32\\bin\\test.exe" at 00400000: native
2805316.666:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernelbase.dll" at 7BBF0000: builtin
2805316.667:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernel32.dll" at 7BEB0000: builtin
2805316.689:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\msvcrt.dll" at 7B0C0000: builtin
2805316.695:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\ucrtbase.dll" at 7AF90000: builtin
2805316.695:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\sechost.dll" at 7B090000: builtin
2805316.695:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\advapi32.dll" at 7B190000: builtin
2805316.713:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\win32u.dll" at 7ACC0000: builtin
2805316.714:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\user32.dll" at 7AD10000: builtin
2805316.714:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\gdi32.dll" at 7AEF0000: builtin
2805316.722:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\shcore.dll" at 7AC30000: builtin
2805316.723:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\shlwapi.dll" at 7AC60000: builtin
2805316.723:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\SHELL32.dll" at 7B1F0000: builtin
2805316.723:0188:018c:trace:loaddll:build_module Loaded L"Z:\\home\\tyson\\issue-proton-vrinit\\test32\\bin\\openvr_api.dll" at 7BB40000: native
2805316.987:0188:018c:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\imm32.dll" at 7AC00000: builtin
2805316.988:0188:018c:warn:debugstr:OutputDebugStringA "ovr_Initialize(...): calling\n"
2805316.988:0188:018c:warn:seh:dispatch_exception "ovr_Initialize(...): calling\n"
2805316.988:0188:018c:trace:seh:dispatch_exception code=40010006 (DBG_PRINTEXCEPTION_C) flags=0 addr=7BC3AF48
2805316.988:0188:018c:trace:seh:dispatch_exception  info[0]=0000001E
2805316.988:0188:018c:trace:seh:dispatch_exception  info[1]=0080FAE0
2805316.988:0188:018c:trace:seh:dispatch_exception eip=7bc3af48 esp=0080f87c ebp=0080f8d4 eflags=00000203
2805316.988:0188:018c:trace:seh:dispatch_exception eax=0080f87c ebx=00006e5c ecx=00000000 edx=0080f890
2805316.988:0188:018c:trace:seh:dispatch_exception esi=0080f904 edi=0080f894 cs=0023 ds=002b es=002b fs=0063 gs=006b ss=002b
2805316.988:0188:018c:trace:seh:call_seh_handlers calling handler at 7BED6620 code=40010006 flags=0
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind code=40010006 flags=2
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind eip=7bebf0be esp=0080eb28 ebp=0080eb30 eflags=00000216
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind eax=00000000 ebx=00000000 ecx=40010006 edx=0080f908
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind esi=0080ed88 edi=0080ed88 cs=0023 ds=002b es=002b fs=0063 gs=006b ss=002b
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind calling handler at 7BF8F1C0 code=40010006 flags=2
2805316.988:0188:018c:trace:seh:__regs_RtlUnwind handler at 7BF8F1C0 returned 1
2805316.989:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: eax=0000003e ebx=7bf4e910 ecx=40010006 edx=0080f908 esi=001e0af0 edi=0080fa3f
2805316.989:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ebp=0080e9e0 esp=0080e9a8 eip=7bf3c24c cs=0023 ss=002b flags=00000216
2805316.989:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ds=002b es=002b fs=0063 gs=006b
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
2805317.020:0188:018c:trace:seh:start_debugger Starting debugger L"winedbg --auto 392 100"
2805317.170:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: eax=000000ea ebx=00000002 ecx=40010006 edx=0080f908 esi=00000002 edi=0080efe0
2805317.170:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ebp=0080f0f0 esp=0080efb0 eip=7bf3cd0c cs=0023 ss=002b flags=00000246
2805317.170:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ds=002b es=002b fs=0063 gs=006b
0194:fixme:dbghelp:elf_search_auxv can't find symbol in module
2805317.244:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: eax=000000ea ebx=00000002 ecx=40010006 edx=0080f908 esi=00000002 edi=0080efe0
2805317.244:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ebp=0080f0f0 esp=0080efb0 eip=7bf3cd0c cs=0023 ss=002b flags=00000246
2805317.244:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ds=002b es=002b fs=0063 gs=006b
2805317.244:0188:018c:trace:seh:call_seh_handlers handler at 7BF696B0 returned 1
Couldn't get first exception for process 0188 Z:\home\tyson\issue-proton-vrinit\test32\bin\test.exe (WOW64).
No backtrace available
Modules:
Module  Address                 Debug info      Name (49 modules)
PE        400000-  410000       Deferred        test
PE-Wine 7a850000-7a8d7000       Deferred        rpcrt4
PE-Wine 7a8f0000-7a966000       Deferred        setupapi
PE-Wine 7a980000-7a9b7000       Deferred        winevulkan
PE-Wine 7a9d0000-7abe5000       Deferred        vrclient
PE-Wine 7ac00000-7ac1d000       Deferred        imm32
PE-Wine 7ac30000-7ac47000       Deferred        shcore
PE-Wine 7ac60000-7acab000       Deferred        shlwapi
PE-Wine 7acc0000-7acf7000       Deferred        win32u
PE-Wine 7ad10000-7aed4000       Deferred        user32
PE-Wine 7aef0000-7af77000       Deferred        gdi32
PE-Wine 7af90000-7b075000       Deferred        ucrtbase
PE-Wine 7b090000-7b0ae000       Deferred        sechost
PE-Wine 7b0c0000-7b173000       Deferred        msvcrt
PE-Wine 7b190000-7b1d2000       Deferred        advapi32
PE-Wine 7b1f0000-7bb24000       Deferred        shell32
PE      7bb40000-7bbdd000       Deferred        openvr_api
PE-Wine 7bbf0000-7be9a000       Deferred        kernelbase
PE-Wine 7beb0000-7bf15000       Deferred        kernel32
PE-Wine 7bf30000-7bfe3000       Deferred        ntdll
ELF     f34be000-f34d5000       Deferred        libegl.so.1
ELF     f3b8b000-f3c33000       Deferred        winevulkan.so
ELF     f3c33000-f3e19000       Deferred        vrclient.so
ELF     f3f2e000-f3f38000       Deferred        libuuid.so.1
ELF     f3f38000-f3f65000       Deferred        libexpat.so.1
ELF     f3f65000-f3fb4000       Deferred        libfontconfig.so.1
ELF     f3fb4000-f3fd7000       Deferred        libbrotlicommon.so.1
ELF     f3fd7000-f3fe5000       Deferred        libbrotlidec.so.1
ELF     f3fe5000-f4001000       Deferred        libz.so.1
ELF     f4001000-f4041000       Deferred        libpng16.so.16
ELF     f4041000-f4108000       Deferred        libfreetype.so.6
ELF     f4115000-f428b000       Deferred        win32u.so
ELF     f428b000-f4375000       Export          ntdll.so
ELF     f7884000-f788b000       Deferred        libxdmcp.so.6
ELF     f788d000-f7892000       Deferred        libxau.so.6
ELF     f7892000-f78c1000       Deferred        libxcb.so.1
ELF     f78c1000-f793e000       Deferred        libgldispatch.so.0
ELF     f793e000-f7954000       Deferred        libxext.so.6
ELF     f7954000-f7aad000       Deferred        libx11.so.6
ELF     f7aad000-f7aea000       Deferred        libglx.so.0
ELF     f7aec000-f7bf9000       Deferred        libm.so.6
ELF     f7bf9000-f7c6d000       Deferred        libgl.so.1
ELF     f7c6d000-f7c72000       Deferred        librt.so.1
ELF     f7c72000-f7eaa000       Deferred        libc.so.6
ELF     f7eaa000-f7eaf000       Deferred        libdl.so.2
ELF     f7eaf000-f7eb4000       Deferred        libpthread.so.0
ELF     f7ec1000-f7f53000       Deferred        gameoverlayrenderer.so
ELF     f7f55000-f7f8b000       Deferred        ld-linux.so.2
ELF     f7f8b000-f7f90000       Deferred        <wine-loader>
Threads:
process  tid      prio    name (all IDs are in hex)
00000020 steam.exe
        00000024    0     
        00000138    0     
        00000154    0     
00000030 services.exe
        00000034    0     
        00000038    0     wine_rpcrt4_server
        00000044    0     wine_rpcrt4_io
        00000068    0     wine_rpcrt4_io
        0000007c    0     wine_rpcrt4_io
        0000009c    0     wine_rpcrt4_io
        000000c4    0     wine_rpcrt4_io
        000000dc    0     
        00000104    0     wine_rpcrt4_io
        00000110    0     wine_rpcrt4_io
0000003c winedevice.exe
        00000040    0     
        0000004c    0     
        00000050    0     wine_sechost_service
        00000054    0     
        00000058    0     
        0000005c    0     
        0000008c    0     
        00000090    0     
00000060 svchost.exe
        00000064    0     
        0000006c    0     
        00000070    0     wine_sechost_service
00000074 plugplay.exe
        00000078    0     
        00000080    0     
        00000084    0     wine_sechost_service
        00000088    0     wine_rpcrt4_server
        000000a8    0     wine_rpcrt4_io
00000094 winedevice.exe
        00000098    0     
        000000a0    0     
        000000a4    0     wine_sechost_service
        000000b0    0     
        000000b4    0     
        000000b8    0     
        000000bc    0     
        000000c8    0     
        000000d0    0     
        000000d4    0     
        000000d8    0     
        000000e0    0     
        000000e4    0     
        000000e8    0     
        000000ec    0     
000000f0 explorer.exe
        000000f4    0     
        000000f8    0     
        000000fc    0     wine_explorer_display_settings_restorer
        00000100    0     wine_rpcrt4_server
00000108 rpcss.exe
        0000010c    0     
        00000114    0     
        00000118    0     wine_sechost_service
        0000011c    0     wine_rpcrt4_server
        00000120    0     wine_rpcrt4_server
        00000124    0     wine_rpcrt4_io
0000012c tabtip.exe
        00000130    0     
        0000013c    0     wine_rpcrt4_server
        00000140    0     
0000014c cmd.exe
        00000150    0     
00000158 conhost.exe
        0000015c    0     
00000188 (D) Z:\home\tyson\issue-proton-vrinit\test32\bin\test.exe
        0000018c    0     
00000198 conhost.exe
        0000019c    0     
System information:
    Wine build: wine-10.0
    Platform: x86_64 (guest: i386)
    Version: Windows 10
    Host system: Linux
    Host version: 6.12.4
2805317.274:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: eax=000000a4 ebx=c0000144 ecx=40010006 edx=0080f908 esi=0080f588 edi=0000000f
2805317.274:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ebp=0080f570 esp=0080f3f0 eip=7bf3c8ac cs=0023 ss=002b flags=00000246
2805317.274:0188:018c:trace:seh:NtGetContextThread 0xfffffffe: ds=002b es=002b fs=0063 gs=006b
2805317.274:0188:018c:warn:seh:dispatch_exception backtrace: --- Exception 0xc0000005.
2805317.275:0188:018c:trace:seh:dispatch_exception code=c0000005 (EXCEPTION_ACCESS_VIOLATION) flags=0 addr=7BB41900
2805317.275:0188:018c:trace:seh:dispatch_exception  info[0]=00000001
2805317.275:0188:018c:trace:seh:dispatch_exception  info[1]=0000000A
2805317.275:0188:018c:trace:seh:dispatch_exception eip=7bb41900 esp=0080fa00 ebp=0080fa90 eflags=00010287
2805317.275:0188:018c:trace:seh:dispatch_exception eax=00000001 ebx=0080fae0 ecx=0000000f edx=fffffffe
2805317.275:0188:018c:trace:seh:dispatch_exception esi=00000000 edi=00000010 cs=0023 ds=002b es=002b fs=0063 gs=006b ss=002b
2805317.275:0188:018c:trace:seh:call_seh_handlers calling handler at 7BF696B0 code=c0000005 flags=0
2805317.275:0188:018c:trace:seh:signal (11, 00000000)
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind code=c0000005 flags=2
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind eip=7bf3d02a esp=0080f328 ebp=0080f330 eflags=00000216
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind eax=00000000 ebx=00000000 ecx=c0000005 edx=0080ff94
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind esi=0080f588 edi=0080f588 cs=0023 ds=002b es=002b fs=0063 gs=006b ss=002b
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind calling handler at 7BF8F1C0 code=c0000005 flags=2
2805317.275:0188:018c:trace:seh:__regs_RtlUnwind handler at 7BF8F1C0 returned 1
2805320.949:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
2805320.956:012c:0140:fixme:uiautomation:msaa_provider_GetPatternProvider Unimplemented patternId 10002
2805320.956:012c:0140:fixme:uiautomation:base_hwnd_provider_GetPatternProvider 00000000002E7460, 10002, 000000000182F8A0: stub
2805320.960:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
```


# 64bit binary log

```
2805457.403:012c:0140:fixme:uiautomation:msaa_provider_GetPatternProvider Unimplemented patternId 10002
2805457.403:012c:0140:fixme:uiautomation:base_hwnd_provider_GetPatternProvider 00000000002E7460, 10002, 000000000182F8A0: stub
2805459.804:020c:0210:trace:seh:sigsys_handler SIGSYS, rax 0xffff, rip 0x600000000005.
2805459.804:020c:0210:trace:seh:install_bpf Seccomp filters already installed.
2805459.806:020c:0210:trace:loaddll:build_module Loaded L"Z:\\home\\tyson\\issue-proton-vrinit\\test64\\bin\\test.exe" at 0000000140000000: native
2805459.807:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernelbase.dll" at 00006FFFFFC00000: builtin
2805459.807:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\kernel32.dll" at 00006FFFFFEC0000: builtin
2805459.812:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\msvcrt.dll" at 00006FFFFFAF0000: builtin
2805459.813:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\ucrtbase.dll" at 00006FFFFF9E0000: builtin
2805459.813:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\sechost.dll" at 00006FFFFFAC0000: builtin
2805459.813:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\advapi32.dll" at 00006FFFFFBA0000: builtin
2805459.815:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\win32u.dll" at 00006FFFFF500000: builtin
2805459.815:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\user32.dll" at 00006FFFFF5E0000: builtin
2805459.815:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\gdi32.dll" at 00006FFFFF550000: builtin
2805459.816:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\shcore.dll" at 00006FFFFE1D0000: builtin
2805459.816:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\shlwapi.dll" at 00006FFFFE200000: builtin
2805459.816:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\SHELL32.dll" at 00006FFFFE260000: builtin
2805459.816:020c:0210:trace:loaddll:build_module Loaded L"Z:\\home\\tyson\\issue-proton-vrinit\\test64\\bin\\openvr_api.dll" at 00006FFFFDD70000: native
2805459.875:020c:0210:trace:loaddll:build_module Loaded L"C:\\windows\\system32\\imm32.dll" at 00006FFFFF4B0000: builtin
2805459.876:020c:0210:warn:debugstr:OutputDebugStringA "ovr_Initialize(...): calling\n"
2805459.876:020c:0210:warn:seh:dispatch_exception "ovr_Initialize(...): calling\n"
2805459.876:020c:0210:trace:seh:dispatch_exception code=40010006 (DBG_PRINTEXCEPTION_C) flags=0 addr=00006FFFFFC0D0C7
2805459.876:020c:0210:trace:seh:dispatch_exception  info[0]=000000000000001E
2805459.876:020c:0210:trace:seh:dispatch_exception  info[1]=000000000022FAC0
2805459.876:020c:0210:trace:seh:dispatch_exception rip=00006fffffc0d0c7 rsp=000000000022f6d0 rbp=000000000022f820 eflags=00000202
2805459.876:020c:0210:trace:seh:dispatch_exception rax=000000000022f718 rbx=000000000022fac0 rcx=000000000022f6f0 rdx=0000000000000000
2805459.876:020c:0210:trace:seh:dispatch_exception rsi=0000000000000010 rdi=00006fffffee2640  r8=000000000022fac0  r9=000000000022f7d8
2805459.876:020c:0210:trace:seh:dispatch_exception r10=00007f0c354f1540 r11=0000000000000000 r12=000000007ffc0000 r13=0000000000000047
2805459.876:020c:0210:trace:seh:dispatch_exception r14=0000000000000000 r15=0000000000000000 mxcsr=00001f80
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 1 base 6fffffc00000 rip 6fffffc0d0c7 rva d0c7 rsp 22f6d0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func d058-d0cf
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFCC1CD8 flags 0 prolog 0xf bytes function 00006FFFFFC0D058-00006FFFFFC0D0CF
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xf: subq $0xc8,%rsp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 inside epilog.
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 1 base 6fffffec0000 rip 6fffffee28c4 rva 228c4 rsp 22f7a0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 22640-22b30
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF0280C flags 0 prolog 0x21 bytes function 00006FFFFFEE2640-00006FFFFFEE2B30
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x21: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x19: subq $0x2a8,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x12: pushq %rbx
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x11: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xf: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xd: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %r15
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %rbp
2805459.876:020c:0210:trace:seh:call_seh_handlers calling TEB handler 00006FFFFFEEA450 (rec=000000000022F6F0 frame=000000000022F910 context=000000000022F1F0 dispatch=000000000022E990) sp=22fa80
2805459.876:020c:0210:trace:seh:RtlUnwindEx code=40010006 flags=2 end_frame=000000000022F910 target_ip=00006FFFFFED454A
2805459.876:020c:0210:trace:seh:RtlUnwindEx  info[0]=000000000000001e
2805459.876:020c:0210:trace:seh:RtlUnwindEx  info[1]=000000000022fac0
2805459.876:020c:0210:trace:seh:RtlUnwindEx rip=00006ffffff743b5 rsp=000000000022dc80 rbp=000000000022dd00 eflags=00000202
2805459.876:020c:0210:trace:seh:RtlUnwindEx rax=000000000022f910 rbx=000000000022f910 rcx=000000000022e340 rdx=00006fffffed454a
2805459.876:020c:0210:trace:seh:RtlUnwindEx rsi=000000000022e990 rdi=000000000022ddf0  r8=000000000022f6f0  r9=00006fffffeed530
2805459.876:020c:0210:trace:seh:RtlUnwindEx r10=00007f0c354f1540 r11=0000000000000000 r12=000000000022f6f0 r13=000000000022e340
2805459.876:020c:0210:trace:seh:RtlUnwindEx r14=000000000022f910 r15=000000007ffc0000 mxcsr=00001f80
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff743b5 rva 343b5 rsp 22dc80
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 34360-34b69
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDEDA8 flags 0 prolog 0x1b bytes function 00006FFFFFF74360-00006FFFFFF74B69
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x648,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff74347 rva 34347 rsp 22e310
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 34320-34351
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDFB30 flags 0 prolog 0x10 bytes function 00006FFFFFF74320-00006FFFFFF74351
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x10: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x500,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffed454a rva 1454a rsp 22e820
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 14530-1454c
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041A8 flags 0 prolog 0x8 bytes function 00006FFFFFED4530-00006FFFFFED454C
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x0(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x20,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x4: leaq 0x0(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffeed52d rva 2d52d rsp 22e850
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 2d500-2d52e
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041B4 flags 0 prolog 0x8 bytes function 00006FFFFFEED500-00006FFFFFEED52E
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x0(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x20,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x4: leaq 0x0(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffeea4a8 rva 2a4a8 rsp 22e880
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 2a450-2a4a9
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041CC flags 0 prolog 0x10 bytes function 00006FFFFFEEA450-00006FFFFFEEA4A9
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x30(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x10: leaq 0x30(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: subq $0x38,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff4f824 rva f824 rsp 22e8e0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func f81c-f82a
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDEC14 flags 1 prolog 0x4 bytes function 00006FFFFFF4F81C-00006FFFFFF4F82A
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x4: subq $0x28,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     handler 00006FFFFFF94DF0 data at 00006FFFFFFDEC20
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff832bd rva 432bd rsp 22e910
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 42f00-4345b
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDED68 flags 0 prolog 0x1b bytes function 00006FFFFFF82F00-00006FFFFFF8345B
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x688,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff85687 rva 45687 rsp 22efe0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 45340-45e48
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDC258 flags 0 prolog 0x1b bytes function 00006FFFFFF85340-00006FFFFFF85E48
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x1a8,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff4f9ef rva f9ef rsp 22f1d0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func f980-f9fc
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDECE4 flags 0 prolog 0x7 bytes function 00006FFFFFF4F980-00006FFFFFF4F9FC
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x7: subq $0x4f8,%rsp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffc00000 rip 6fffffc0d0c7 rva d0c7 rsp 22f6d0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func d058-d0cf
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFCC1CD8 flags 0 prolog 0xf bytes function 00006FFFFFC0D058-00006FFFFFC0D0CF
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xf: subq $0xc8,%rsp
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 inside epilog.
2805459.876:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffee28c4 rva 228c4 rsp 22f7a0
2805459.876:020c:0210:trace:unwind:dump_unwind_info **** func 22640-22b30
2805459.876:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF0280C flags 0 prolog 0x21 bytes function 00006FFFFFEE2640-00006FFFFFEE2B30
2805459.876:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x21: leaq 0x80(%rsp),rbp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x19: subq $0x2a8,%rsp
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x12: pushq %rbx
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x11: pushq %r12
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xf: pushq %r13
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xd: pushq %r14
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %r15
2805459.876:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %rbp
2805459.876:020c:0210:trace:seh:RtlRestoreContext returning to 00006FFFFFED454A stack 000000000022F7A0
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
2805462.321:020c:0210:warn:debugstr:OutputDebugStringA "ovr_Initialize(...): returned error 0 and object 00000000002a3a70\n"
2805462.321:020c:0210:warn:seh:dispatch_exception "ovr_Initialize(...): returned error 0 and object 00000000002a3a70\n"
2805462.321:020c:0210:trace:seh:dispatch_exception code=40010006 (DBG_PRINTEXCEPTION_C) flags=0 addr=00006FFFFFC0D0C7
2805462.321:020c:0210:trace:seh:dispatch_exception  info[0]=0000000000000043
2805462.321:020c:0210:trace:seh:dispatch_exception  info[1]=000000000022FAC0
2805462.321:020c:0210:trace:seh:dispatch_exception rip=00006fffffc0d0c7 rsp=000000000022f6d0 rbp=000000000022f820 eflags=00000202
2805462.321:020c:0210:trace:seh:dispatch_exception rax=000000000022f718 rbx=000000000022fac0 rcx=000000000022f6f0 rdx=0000000000000000
2805462.321:020c:0210:trace:seh:dispatch_exception rsi=0000000000000000 rdi=00006fffffee2640  r8=000000000022fac0  r9=000000000022f7d8
2805462.321:020c:0210:trace:seh:dispatch_exception r10=00007f0c354f1540 r11=0000000000000000 r12=000000007ffc0000 r13=0000000000000010
2805462.321:020c:0210:trace:seh:dispatch_exception r14=0000000000000000 r15=0000000000000000 mxcsr=00001fa0
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 1 base 6fffffc00000 rip 6fffffc0d0c7 rva d0c7 rsp 22f6d0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func d058-d0cf
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFCC1CD8 flags 0 prolog 0xf bytes function 00006FFFFFC0D058-00006FFFFFC0D0CF
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xf: subq $0xc8,%rsp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 inside epilog.
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 1 base 6fffffec0000 rip 6fffffee28c4 rva 228c4 rsp 22f7a0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 22640-22b30
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF0280C flags 0 prolog 0x21 bytes function 00006FFFFFEE2640-00006FFFFFEE2B30
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x21: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x19: subq $0x2a8,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x12: pushq %rbx
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x11: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xf: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xd: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %r15
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %rbp
2805462.321:020c:0210:trace:seh:call_seh_handlers calling TEB handler 00006FFFFFEEA450 (rec=000000000022F6F0 frame=000000000022F910 context=000000000022F1F0 dispatch=000000000022E990) sp=22fa80
2805462.321:020c:0210:trace:seh:RtlUnwindEx code=40010006 flags=2 end_frame=000000000022F910 target_ip=00006FFFFFED454A
2805462.321:020c:0210:trace:seh:RtlUnwindEx  info[0]=0000000000000043
2805462.321:020c:0210:trace:seh:RtlUnwindEx  info[1]=000000000022fac0
2805462.321:020c:0210:trace:seh:RtlUnwindEx rip=00006ffffff743b5 rsp=000000000022dc80 rbp=000000000022dd00 eflags=00000202
2805462.321:020c:0210:trace:seh:RtlUnwindEx rax=000000000022f910 rbx=000000000022f910 rcx=000000000022e340 rdx=00006fffffed454a
2805462.321:020c:0210:trace:seh:RtlUnwindEx rsi=000000000022e990 rdi=000000000022ddf0  r8=000000000022f6f0  r9=00006fffffeed530
2805462.321:020c:0210:trace:seh:RtlUnwindEx r10=00007f0c354f1540 r11=0000000000000000 r12=000000000022f6f0 r13=000000000022e340
2805462.321:020c:0210:trace:seh:RtlUnwindEx r14=000000000022f910 r15=000000007ffc0000 mxcsr=00001fa0
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff743b5 rva 343b5 rsp 22dc80
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 34360-34b69
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDEDA8 flags 0 prolog 0x1b bytes function 00006FFFFFF74360-00006FFFFFF74B69
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x648,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff74347 rva 34347 rsp 22e310
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 34320-34351
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDFB30 flags 0 prolog 0x10 bytes function 00006FFFFFF74320-00006FFFFFF74351
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x10: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x500,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffed454a rva 1454a rsp 22e820
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 14530-1454c
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041A8 flags 0 prolog 0x8 bytes function 00006FFFFFED4530-00006FFFFFED454C
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x0(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x20,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x4: leaq 0x0(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffeed52d rva 2d52d rsp 22e850
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 2d500-2d52e
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041B4 flags 0 prolog 0x8 bytes function 00006FFFFFEED500-00006FFFFFEED52E
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x0(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x8: subq $0x20,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x4: leaq 0x0(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffeea4a8 rva 2a4a8 rsp 22e880
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 2a450-2a4a9
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF041CC flags 0 prolog 0x10 bytes function 00006FFFFFEEA450-00006FFFFFEEA4A9
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x30(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x10: leaq 0x30(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: subq $0x38,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff4f824 rva f824 rsp 22e8e0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func f81c-f82a
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDEC14 flags 1 prolog 0x4 bytes function 00006FFFFFF4F81C-00006FFFFFF4F82A
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x4: subq $0x28,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     handler 00006FFFFFF94DF0 data at 00006FFFFFFDEC20
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff832bd rva 432bd rsp 22e910
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 42f00-4345b
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDED68 flags 0 prolog 0x1b bytes function 00006FFFFFF82F00-00006FFFFFF8345B
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x688,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff85687 rva 45687 rsp 22efe0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 45340-45e48
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDC258 flags 0 prolog 0x1b bytes function 00006FFFFFF85340-00006FFFFFF85E48
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1b: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x13: subq $0x1a8,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xc: pushq %rbx
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %rsi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xa: pushq %rdi
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x7: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x5: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x3: pushq %r15
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x1: pushq %rbp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6ffffff40000 rip 6ffffff4f9ef rva f9ef rsp 22f1d0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func f980-f9fc
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFFDECE4 flags 0 prolog 0x7 bytes function 00006FFFFFF4F980-00006FFFFFF4F9FC
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x7: subq $0x4f8,%rsp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffc00000 rip 6fffffc0d0c7 rva d0c7 rsp 22f6d0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func d058-d0cf
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFCC1CD8 flags 0 prolog 0xf bytes function 00006FFFFFC0D058-00006FFFFFC0D0CF
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xf: subq $0xc8,%rsp
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 inside epilog.
2805462.321:020c:0210:trace:unwind:RtlVirtualUnwind2 type 2 base 6fffffec0000 rip 6fffffee28c4 rva 228c4 rsp 22f7a0
2805462.321:020c:0210:trace:unwind:dump_unwind_info **** func 22640-22b30
2805462.321:020c:0210:trace:unwind:dump_unwind_info unwind info at 00006FFFFFF0280C flags 0 prolog 0x21 bytes function 00006FFFFFEE2640-00006FFFFFEE2B30
2805462.321:020c:0210:trace:unwind:dump_unwind_info     frame register rbp offset 0x80(%rsp)
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x21: leaq 0x80(%rsp),rbp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x19: subq $0x2a8,%rsp
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x12: pushq %rbx
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x11: pushq %r12
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xf: pushq %r13
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xd: pushq %r14
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0xb: pushq %r15
2805462.321:020c:0210:trace:unwind:dump_unwind_info     0x9: pushq %rbp
2805462.321:020c:0210:trace:seh:RtlRestoreContext returning to 00006FFFFFED454A stack 000000000022F7A0
2805462.334:020c:0210:trace:vrclient:winIVRClientCore_IVRClientCore_003_Cleanup 00000000002A39B0
2805462.334:020c:0210:trace:vrclient:destroy_winIVRSystem_IVRSystem_022 00000000002A3A70
2805462.334:020c:0210:trace:vrclient:destroy_compositor_data Destroying compositor data.
2805462.334:020c:0210:trace:vrclient:DllMain (00006FFFFD9D0000, 0, 0000000000000000)
2805462.335:020c:0210:trace:loaddll:free_modref Unloaded module L"C:\\vrclient\\bin\\vrclient_x64.dll" : builtin
2805464.774:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
2805464.781:012c:0140:fixme:uiautomation:msaa_provider_GetPatternProvider Unimplemented patternId 10002
2805464.781:012c:0140:fixme:uiautomation:base_hwnd_provider_GetPatternProvider 00000000002E8DF0, 10002, 000000000182F8A0: stub
2805464.785:012c:0140:fixme:oleacc:find_class_data unhandled window class: L"#32769"
```


# Nix

Also included is a nix flake for building the test program as

* a 32bit windows executable (`nix build .#test32 -o test32`),
* a 64bit windows executable (`nix build .#test64 -o test64`).
