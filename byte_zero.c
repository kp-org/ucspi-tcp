#include "byte.h"

void byte_zero(void *s,register unsigned int n)
{
  register char *t = s;

  for (;;) {
    if (!n) break; *t++ = 0; --n;
    if (!n) break; *t++ = 0; --n;
    if (!n) break; *t++ = 0; --n;
    if (!n) break; *t++ = 0; --n;
  }
}
