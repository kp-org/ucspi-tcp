#include "iopause.h"
#include "taia.h"
#include "byte.h"
#include "dns.h"
#include "ip6.h"

struct dns_transmit dns_resolve_tx = {0};

int dns_resolve(const char *q, const char qtype[2])
{
  struct taia stamp;
  struct taia deadline;
  char servers[256];
  iopause_fd x[1];
  int r, riop;

  if (dns_resolvconfip(servers) == -1) return -1;
  if (dns_transmit_start(&dns_resolve_tx,servers,1,q,qtype,V6any) == -1) return -1;

  for (;;) {
    taia_now(&stamp);
    taia_uint(&deadline,120);
    taia_add(&deadline,&deadline,&stamp);
    dns_transmit_io(&dns_resolve_tx,x,&deadline);
    riop = iopause(x,1,&deadline,&stamp);
    if (riop > 0) {
      r = dns_transmit_get(&dns_resolve_tx,x,&stamp);
      if (r == -1) return -1;
      if (r == 1) return 0;
    } else
      return -1;
  }
}
