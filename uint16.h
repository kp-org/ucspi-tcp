#ifndef UINT16_H
#define UINT16_H

typedef unsigned short uint16;

extern void uint16_pack(char *,uint16);
extern void uint16_pack_big(char *,uint16);
extern void uint16_unpack(char *,uint16 *);
extern void uint16_unpack_big(char *,uint16 *);

#endif
