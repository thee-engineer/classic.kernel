/*
   Copyright 2018 Alexandru-Paul Copil

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/


#include "vfb.h"
#include "mm.h"
#include "conv.h"
#include "memutils.h"


void _memdump(void* ptr, u32 len) {
    u32* p = (u32*)ptr;
    void* bufr = cls_knl_malloc(0x40);

    while(len-- > 0) {
        conv_hex_str(bufr, (u32) p); vfb_print(bufr); vfb_print(" : ");
        conv_hex_str(bufr, (u32)*p); vfb_println(bufr);
        p++;
    }

    cls_knl_free(bufr);
}



void cmain(void) {

    void* bufr = cls_knl_malloc(0x40);
    conv_hex_str(bufr, 0xDEADBEEF);
    vfb_println(bufr);
    cls_knl_free(bufr);

    void* playground = cls_knl_malloc(0x100);
    u8* p = (u8*) playground;

    memzero(playground, 0x400);

    p[10] = 0x11;
    p[11] = 0x12;
    p[12] = 0x13;
    p[13] = 0x14;
    p[14] = 0x15;
    p[15] = 0x16;
    p[16] = 0x17;
    p[17] = 0x18;
    p[18] = 0x19;
    p[19] = 0x1A;
    p[20] = 0x1B;

    memcopy(p+10, 7, p+30);

    memcopy(p+10, 11, p+0x30);
    memcopy(p+10, 11, p+0x50);

    memcopy(p+0x30, 10, p+0x34);
    memcopy(p+0x50, 10, p+0x50-0x8);



    _memdump(playground, 60);

}
