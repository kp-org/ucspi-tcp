# Don't edit Makefile! Use conf-* for configuration.

SHELL=/bin/sh

default: it

addcr: \
load addcr.o unix.a byte.a
	./load addcr unix.a byte.a 

addcr.o: \
compile addcr.c buffer.h exit.h
	./compile addcr.c

alloc.o: \
compile alloc.c alloc.h error.h
	./compile alloc.c

alloc_re.o: \
compile alloc_re.c alloc.h byte.h
	./compile alloc_re.c

argv0: \
load argv0.o unix.a byte.a
	./load argv0 unix.a byte.a 

argv0.o: \
compile argv0.c pathexec.h strerr.h
	./compile argv0.c

auto-str: \
load auto-str.o unix.a byte.a
	./load auto-str unix.a byte.a 

auto-str.o: \
compile auto-str.c buffer.h readwrite.h exit.h
	./compile auto-str.c

auto_home.c: \
auto-str home
	./auto-str auto_home `head -1 home` > auto_home.c

auto_home.o: \
compile auto_home.c
	./compile auto_home.c

buffer.o: \
compile buffer.c buffer.h
	./compile buffer.c

buffer_0.o: \
compile buffer_0.c readwrite.h buffer.h
	./compile buffer_0.c

buffer_1.o: \
compile buffer_1.c readwrite.h buffer.h
	./compile buffer_1.c

buffer_2.o: \
compile buffer_2.c readwrite.h buffer.h
	./compile buffer_2.c

buffer_copy.o: \
compile buffer_copy.c buffer.h
	./compile buffer_copy.c

buffer_get.o: \
compile buffer_get.c buffer.h byte.h error.h
	./compile buffer_get.c

buffer_put.o: \
compile buffer_put.c buffer.h str.h byte.h error.h
	./compile buffer_put.c

byte.a: \
makelib byte_chr.o byte_copy.o byte_cr.o byte_diff.o byte_rchr.o \
byte_zero.o case_diffb.o case_diffs.o fmt_ulong.o ip4_fmt.o \
ip4_scan.o scan_ulong.o str_chr.o str_diff.o str_len.o str_start.o \
uint16_pack.o uint16_unpack.o uint32_pack.o uint32_unpack.o \
ip6_compactaddr.o ip6_expandaddr.o ip6_scan.o scan_xlong.o fmt_xlong.o hexconversion.o
	./makelib byte.a byte_chr.o byte_copy.o byte_cr.o \
	byte_diff.o byte_rchr.o byte_zero.o case_diffb.o \
	case_diffs.o fmt_ulong.o ip4_fmt.o ip4_scan.o scan_ulong.o \
	str_chr.o str_diff.o str_len.o str_start.o uint16_pack.o \
	uint16_unpack.o uint32_pack.o uint32_unpack.o ip6_compactaddr.o \
	ip6_expandaddr.o ip6_scan.o scan_xlong.o fmt_xlong.o hexconversion.o

byte_chr.o: \
compile byte_chr.c byte.h
	./compile byte_chr.c

byte_copy.o: \
compile byte_copy.c byte.h
	./compile byte_copy.c

byte_cr.o: \
compile byte_cr.c byte.h
	./compile byte_cr.c

byte_diff.o: \
compile byte_diff.c byte.h
	./compile byte_diff.c

byte_rchr.o: \
compile byte_rchr.c byte.h
	./compile byte_rchr.c

byte_zero.o: \
compile byte_zero.c byte.h
	./compile byte_zero.c

case_diffb.o: \
compile case_diffb.c case.h
	./compile case_diffb.c

case_diffs.o: \
compile case_diffs.c case.h
	./compile case_diffs.c

cdb.a: \
makelib cdb.o cdb_hash.o cdb_make.o
	./makelib cdb.a cdb.o cdb_hash.o cdb_make.o

cdb.o: \
compile cdb.c readwrite.h error.h seek.h byte.h cdb.h uint32.h
	./compile cdb.c

cdb_hash.o: \
compile cdb_hash.c cdb.h uint32.h
	./compile cdb_hash.c

cdb_make.o: \
compile cdb_make.c readwrite.h seek.h error.h alloc.h cdb.h uint32.h \
cdb_make.h buffer.h uint32.h
	./compile cdb_make.c

chkshsgr: \
load chkshsgr.o
	./load chkshsgr 

chkshsgr.o: \
compile chkshsgr.c exit.h
	./compile chkshsgr.c

choose: \
home warn-auto.sh choose.sh 
	rm -f choose
	cat warn-auto.sh choose.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> choose
	chmod 755 choose

commands.o: \
compile commands.c buffer.h stralloc.h gen_alloc.h str.h case.h \
commands.h
	./compile commands.c

compile: \
warn-auto.sh conf-cc
	( cat warn-auto.sh; \
	echo exec "`head -1 conf-cc`" '-c $${1+"$$@"}' \
	) > compile
	chmod 755 compile

date@: \
home warn-auto.sh date@.sh 
	rm -f date@
	cat warn-auto.sh date@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> date@
	chmod 755 date@

date4@: \
home warn-auto.sh date4@.sh 
	rm -f date4@
	cat warn-auto.sh date4@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> date4@
	chmod 755 date4@

delcr: \
load delcr.o unix.a byte.a
	./load delcr unix.a byte.a 

delcr.o: \
compile delcr.c buffer.h exit.h
	./compile delcr.c

dns.a: \
makelib dns_dfd.o dns_domain.o dns_dtda.o dns_ip.o dns_ipq.o \
dns_name.o dns_nd.o dns_packet.o dns_random.o dns_rcip.o dns_rcrw.o \
dns_resolve.o dns_sortip.o dns_transmit.o dns_txt.o dns_ip6.o \
dns_sortip6.o dns_nd6.o dns_ipq6.o
	./makelib dns.a dns_dfd.o dns_domain.o dns_dtda.o dns_ip.o \
	dns_ipq.o dns_name.o dns_nd.o dns_packet.o dns_random.o \
	dns_rcip.o dns_rcrw.o dns_resolve.o dns_sortip.o \
	dns_transmit.o dns_txt.o dns_ip6.o dns_sortip6.o dns_nd6.o \
	dns_ipq6.o

dns_dfd.o: \
compile dns_dfd.c error.h alloc.h byte.h dns.h stralloc.h gen_alloc.h \
iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_dfd.c

dns_domain.o: \
compile dns_domain.c error.h alloc.h case.h byte.h dns.h stralloc.h \
gen_alloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_domain.c

dns_dtda.o: \
compile dns_dtda.c stralloc.h gen_alloc.h dns.h stralloc.h iopause.h \
taia.h tai.h uint64.h taia.h
	./compile dns_dtda.c

dns_ip.o: \
compile dns_ip.c stralloc.h gen_alloc.h uint16.h byte.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_ip.c

dns_ipq.o: \
compile dns_ipq.c stralloc.h gen_alloc.h case.h byte.h str.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_ipq.c

dns_name.o: \
compile dns_name.c stralloc.h gen_alloc.h uint16.h byte.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_name.c

dns_nd.o: \
compile dns_nd.c byte.h fmt.h dns.h stralloc.h gen_alloc.h iopause.h \
taia.h tai.h uint64.h taia.h
	./compile dns_nd.c

dns_packet.o: \
compile dns_packet.c error.h dns.h stralloc.h gen_alloc.h iopause.h \
taia.h tai.h uint64.h taia.h
	./compile dns_packet.c

dns_random.o: \
compile dns_random.c dns.h stralloc.h gen_alloc.h iopause.h taia.h \
tai.h uint64.h taia.h taia.h uint32.h
	./compile dns_random.c

dns_rcip.o: \
compile dns_rcip.c taia.h tai.h uint64.h openreadclose.h stralloc.h \
gen_alloc.h byte.h ip4.h env.h dns.h stralloc.h iopause.h taia.h \
taia.h
	./compile dns_rcip.c

dns_rcrw.o: \
compile dns_rcrw.c taia.h tai.h uint64.h env.h byte.h str.h \
openreadclose.h stralloc.h gen_alloc.h dns.h stralloc.h iopause.h \
taia.h taia.h
	./compile dns_rcrw.c

dns_resolve.o: \
compile dns_resolve.c iopause.h taia.h tai.h uint64.h taia.h byte.h \
dns.h stralloc.h gen_alloc.h iopause.h taia.h
	./compile dns_resolve.c

dns_sortip.o: \
compile dns_sortip.c byte.h dns.h stralloc.h gen_alloc.h iopause.h \
taia.h tai.h uint64.h taia.h
	./compile dns_sortip.c

dns_transmit.o: \
compile dns_transmit.c socket.h uint16.h alloc.h error.h byte.h \
readwrite.h uint16.h dns.h stralloc.h gen_alloc.h iopause.h taia.h \
tai.h uint64.h taia.h uint32.h
	./compile dns_transmit.c

dns_txt.o: \
compile dns_txt.c stralloc.h gen_alloc.h uint16.h byte.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_txt.c

env.o: \
compile env.c str.h env.h
	./compile env.c

error.o: \
compile error.c error.h
	./compile error.c

error_str.o: \
compile error_str.c error.h
	./compile error_str.c

fd_copy.o: \
compile fd_copy.c fd.h
	./compile fd_copy.c

fd_move.o: \
compile fd_move.c fd.h
	./compile fd_move.c

finger@: \
home warn-auto.sh finger@.sh 
	rm -f finger@
	cat warn-auto.sh finger@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> finger@
	chmod 755 finger@

finger4@: \
home warn-auto.sh finger4@.sh 
	rm -f finger4@
	cat warn-auto.sh finger4@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> finger4@
	chmod 755 finger4@

fixcrio: \
load fixcrio.o time.a unix.a byte.a
	./load fixcrio time.a unix.a byte.a 

fixcrio.o: \
compile fixcrio.c sig.h buffer.h strerr.h byte.h readwrite.h exit.h \
iopause.h taia.h tai.h uint64.h pathexec.h
	./compile fixcrio.c

fmt_ulong.o: \
compile fmt_ulong.c fmt.h
	./compile fmt_ulong.c

fork.h: \
choose compile load tryvfork.c fork.h1 fork.h2
	./choose cl tryvfork fork.h1 fork.h2 > fork.h

getln.o: \
compile getln.c byte.h getln.h buffer.h stralloc.h gen_alloc.h
	./compile getln.c

getln2.o: \
compile getln2.c byte.h getln.h buffer.h stralloc.h gen_alloc.h
	./compile getln2.c

hassgact.h: \
choose compile load trysgact.c hassgact.h1 hassgact.h2
	./choose cl trysgact hassgact.h1 hassgact.h2 > hassgact.h

hassgprm.h: \
choose compile load trysgprm.c hassgprm.h1 hassgprm.h2
	./choose cl trysgprm hassgprm.h1 hassgprm.h2 > hassgprm.h

hasshsgr.h: \
choose compile load tryshsgr.c hasshsgr.h1 hasshsgr.h2 chkshsgr \
warn-shsgr
	./chkshsgr || ( cat warn-shsgr; exit 1 )
	./choose clr tryshsgr hasshsgr.h1 hasshsgr.h2 > hasshsgr.h

haswaitp.h: \
choose compile load trywaitp.c haswaitp.h1 haswaitp.h2
	./choose cl trywaitp haswaitp.h1 haswaitp.h2 > haswaitp.h


http@: \
home warn-auto.sh http@.sh 
	rm -f http@
	cat warn-auto.sh http@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> http@
	chmod 755 http@

http4@: \
home warn-auto.sh http4@.sh 
	rm -f http4@
	cat warn-auto.sh http4@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> http4@
	chmod 755 http4@

iopause.h: \
choose compile trypoll.c iopause.h1 iopause.h2
	./choose clr trypoll iopause.h1 iopause.h2 > iopause.h

iopause.o: \
compile iopause.c taia.h tai.h uint64.h select.h iopause.h taia.h
	./compile iopause.c

ip4_bit.o: \
compile ip4_bit.c ip4_bit.h strerr.h ip4.h byte.h
	./compile ip4_bit.c

ip4_fmt.o: \
compile ip4_fmt.c fmt.h ip4.h
	./compile ip4_fmt.c

ip4_scan.o: \
compile ip4_scan.c scan.h ip4.h
	./compile ip4_scan.c
  
it: it-base sysdeps

it-base: \
tcpserver tcprules tcprulescheck argv0 recordio tcpclient who@ date@ \
finger@ http@ tcpcat mconnect mconnect-io addcr delcr fixcrio rblsmtpd \
who4@ date4@ finger4@ http4@ tcpcat4 mconnect4 \
sysdeps


load: \
warn-auto.sh conf-ld
	( cat warn-auto.sh; \
	echo 'main="$$1"; shift'; \
	echo exec "`head -1 conf-ld`" \
	'-o "$$main" "$$main".o $${1+"$$@"}' \
	) > load
	chmod 755 load

makelib: \
warn-auto.sh systype
	( cat warn-auto.sh; \
	echo 'main="$$1"; shift'; \
	echo 'rm -f "$$main"'; \
	echo 'ar cr "$$main" $${1+"$$@"}'; \
	case "`cat systype`" in \
	sunos-5.*) ;; \
	unix_sv*) ;; \
	irix64-*) ;; \
	irix-*) ;; \
	dgux-*) ;; \
	hp-ux-*) ;; \
	sco*) ;; \
	*) echo 'ranlib "$$main"' ;; \
	esac \
	) > makelib
	chmod 755 makelib

mconnect: \
home warn-auto.sh mconnect.sh
	rm -f mconnect
	cat warn-auto.sh mconnect.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> mconnect
	chmod 755 mconnect

mconnect4: \
home warn-auto.sh mconnect4.sh
	rm -f mconnect4
	cat warn-auto.sh mconnect4.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> mconnect4
	chmod 755 mconnect4

mconnect-io: \
load mconnect-io.o unix.a byte.a
	./load mconnect-io unix.a byte.a 

mconnect-io.o: \
compile mconnect-io.c sig.h wait.h fork.h buffer.h strerr.h \
readwrite.h exit.h
	./compile mconnect-io.c

ndelay_off.o: \
compile ndelay_off.c ndelay.h
	./compile ndelay_off.c

ndelay_on.o: \
compile ndelay_on.c ndelay.h
	./compile ndelay_on.c

open_read.o: \
compile open_read.c open.h
	./compile open_read.c

open_trunc.o: \
compile open_trunc.c open.h
	./compile open_trunc.c

open_write.o: \
compile open_write.c open.h
	./compile open_write.c

openreadclose.o: \
compile openreadclose.c error.h open.h readclose.h stralloc.h \
gen_alloc.h openreadclose.h stralloc.h
	./compile openreadclose.c

pathexec_env.o: \
compile pathexec_env.c stralloc.h gen_alloc.h alloc.h str.h byte.h \
env.h pathexec.h
	./compile pathexec_env.c

pathexec_run.o: \
compile pathexec_run.c error.h stralloc.h gen_alloc.h str.h env.h \
pathexec.h
	./compile pathexec_run.c

prot.o: \
compile prot.c hasshsgr.h prot.h
	./compile prot.c

rblsmtpd: \
load rblsmtpd.o commands.o dns.a time.a unix.a byte.a socket.lib
	./load rblsmtpd commands.o dns.a time.a unix.a byte.a  \
	`cat socket.lib`

rblsmtpd.o: \
compile rblsmtpd.c byte.h str.h scan.h fmt.h env.h exit.h sig.h \
buffer.h readwrite.h sgetopt.h subgetopt.h strerr.h stralloc.h \
gen_alloc.h commands.h pathexec.h dns.h stralloc.h iopause.h taia.h \
tai.h uint64.h taia.h ip6.h
	./compile rblsmtpd.c

readclose.o: \
compile readclose.c readwrite.h error.h readclose.h stralloc.h \
gen_alloc.h
	./compile readclose.c

recordio: \
load recordio.o time.a unix.a byte.a
	./load recordio time.a unix.a byte.a 

recordio.o: \
compile recordio.c sig.h buffer.h strerr.h str.h byte.h readwrite.h \
exit.h fmt.h iopause.h taia.h tai.h uint64.h pathexec.h
	./compile recordio.c

remoteinfo.o: \
compile remoteinfo.c fmt.h buffer.h socket.h uint16.h error.h \
iopause.h taia.h tai.h uint64.h timeoutconn.h uint16.h remoteinfo.h \
stralloc.h gen_alloc.h uint16.h uint32.h
	./compile remoteinfo.c

remoteinfo6.o: \
compile remoteinfo6.c fmt.h buffer.h socket.h uint16.h error.h \
iopause.h taia.h tai.h uint64.h timeoutconn.h uint16.h remoteinfo.h \
stralloc.h gen_alloc.h uint16.h uint32.h
	./compile remoteinfo6.c

rules.o: \
compile rules.c alloc.h stralloc.h gen_alloc.h open.h cdb.h uint32.h byte.h strerr.h \
fmt.h getln.h rules.h stralloc.h ip4_bit.h ip6.h
	./compile rules.c

scan_ulong.o: \
compile scan_ulong.c scan.h
	./compile scan_ulong.c

seek_set.o: \
compile seek_set.c seek.h
	./compile seek_set.c

select.h: \
choose compile trysysel.c select.h1 select.h2
	./choose c trysysel select.h1 select.h2 > select.h

sgetopt.o: \
compile sgetopt.c buffer.h sgetopt.h subgetopt.h subgetopt.h
	./compile sgetopt.c

sig.o: \
compile sig.c sig.h
	./compile sig.c

sig_block.o: \
compile sig_block.c sig.h hassgprm.h
	./compile sig_block.c

sig_catch.o: \
compile sig_catch.c sig.h hassgact.h
	./compile sig_catch.c

sig_pause.o: \
compile sig_pause.c sig.h hassgprm.h
	./compile sig_pause.c

socket.lib: \
trylsock.c compile load
	( ( ./compile trylsock.c && \
	./load trylsock -lsocket -lnsl ) >/dev/null 2>&1 \
	&& echo -lsocket -lnsl || exit 0 ) > socket.lib
	rm -f trylsock.o trylsock

socket_accept.o: \
compile socket_accept.c byte.h socket.h uint16.h uint32.h
	./compile socket_accept.c

socket_bind.o: \
compile socket_bind.c byte.h socket.h uint16.h uint32.h
	./compile socket_bind.c

socket_conn.o: \
compile socket_conn.c readwrite.h byte.h socket.h uint16.h uint32.h
	./compile socket_conn.c

socket_delay.o: \
compile socket_delay.c socket.h uint16.h uint32.h
	./compile socket_delay.c

socket_listen.o: \
compile socket_listen.c socket.h uint16.h uint32.h
	./compile socket_listen.c

socket_local.o: \
compile socket_local.c byte.h socket.h uint16.h uint32.h
	./compile socket_local.c

socket_opts.o: \
compile socket_opts.c socket.h uint16.h uint32.h
	./compile socket_opts.c

socket_opts6.o: \
compile socket_opts6.c socket.h uint16.h uint32.h
	./compile socket_opts6.c

socket_remote.o: \
compile socket_remote.c byte.h socket.h uint16.h uint32.h
	./compile socket_remote.c

socket_tcp.o: \
compile socket_tcp.c ndelay.h socket.h uint16.h uint32.h
	./compile socket_tcp.c

socket_udp.o: \
compile socket_udp.c ndelay.h socket.h uint16.h uint32.h
	./compile socket_udp.c

str_chr.o: \
compile str_chr.c str.h
	./compile str_chr.c

str_diff.o: \
compile str_diff.c str.h
	./compile str_diff.c

str_len.o: \
compile str_len.c str.h
	./compile str_len.c

str_start.o: \
compile str_start.c str.h
	./compile str_start.c

stralloc_cat.o: \
compile stralloc_cat.c byte.h stralloc.h gen_alloc.h
	./compile stralloc_cat.c

stralloc_catb.o: \
compile stralloc_catb.c stralloc.h gen_alloc.h byte.h
	./compile stralloc_catb.c

stralloc_cats.o: \
compile stralloc_cats.c byte.h str.h stralloc.h gen_alloc.h
	./compile stralloc_cats.c

stralloc_copy.o: \
compile stralloc_copy.c byte.h stralloc.h gen_alloc.h
	./compile stralloc_copy.c

stralloc_eady.o: \
compile stralloc_eady.c alloc.h stralloc.h gen_alloc.h \
gen_allocdefs.h
	./compile stralloc_eady.c

stralloc_opyb.o: \
compile stralloc_opyb.c stralloc.h gen_alloc.h byte.h
	./compile stralloc_opyb.c

stralloc_opys.o: \
compile stralloc_opys.c byte.h str.h stralloc.h gen_alloc.h
	./compile stralloc_opys.c

stralloc_pend.o: \
compile stralloc_pend.c alloc.h stralloc.h gen_alloc.h \
gen_allocdefs.h
	./compile stralloc_pend.c

strerr_die.o: \
compile strerr_die.c buffer.h exit.h strerr.h
	./compile strerr_die.c

strerr_sys.o: \
compile strerr_sys.c error.h strerr.h
	./compile strerr_sys.c

subgetopt.o: \
compile subgetopt.c subgetopt.h
	./compile subgetopt.c

sysdeps: systype compile load hassgact.h hassgprm.h hasshsgr.h \
haswaitp.h iopause.h select.h uint64.h
	rm -f sysdeps
	cat systype compile load >> sysdeps
	grep sysdep haswaitp.h >> sysdeps
	grep sysdep hassgact.h >> sysdeps
	grep sysdep hassgprm.h >> sysdeps
	grep sysdep hasshsgr.h >> sysdeps
	grep sysdep select.h >> sysdeps
	grep sysdep uint64.h >> sysdeps
	grep sysdep iopause.h >> sysdeps

systype: \
find-systype.sh conf-cc conf-ld trycpp.c x86cpuid.c
	( cat warn-auto.sh; \
	echo CC=\'`head -1 conf-cc`\'; \
	echo LD=\'`head -1 conf-ld`\'; \
	cat find-systype.sh; \
	) | sh > systype

tai_pack.o: \
compile tai_pack.c tai.h uint64.h
	./compile tai_pack.c

taia_add.o: \
compile taia_add.c taia.h tai.h uint64.h
	./compile taia_add.c

taia_approx.o: \
compile taia_approx.c taia.h tai.h uint64.h
	./compile taia_approx.c

taia_frac.o: \
compile taia_frac.c taia.h tai.h uint64.h
	./compile taia_frac.c

taia_less.o: \
compile taia_less.c taia.h tai.h uint64.h
	./compile taia_less.c

taia_now.o: \
compile taia_now.c taia.h tai.h uint64.h
	./compile taia_now.c

taia_pack.o: \
compile taia_pack.c taia.h tai.h uint64.h
	./compile taia_pack.c

taia_sub.o: \
compile taia_sub.c taia.h tai.h uint64.h
	./compile taia_sub.c

taia_uint.o: \
compile taia_uint.c taia.h tai.h uint64.h
	./compile taia_uint.c

tcpcat: \
home warn-auto.sh tcpcat.sh home
	rm -f tcpcat
	cat warn-auto.sh tcpcat.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> tcpcat
	chmod 755 tcpcat

tcpcat4: \
home warn-auto.sh tcpcat4.sh home
	rm -f tcpcat4
	cat warn-auto.sh tcpcat4.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> tcpcat4
	chmod 755 tcpcat4

tcpclient: \
load tcpclient.o remoteinfo6.o dns.a time.a unix.a \
byte.a socket.lib byte.h timeoutconn6.o
	./load tcpclient remoteinfo6.o timeoutconn6.o dns.a time.a \
	unix.a byte.a  `cat socket.lib`

tcpclient.o: \
compile tcpclient.c sig.h exit.h sgetopt.h subgetopt.h uint16.h fmt.h \
scan.h str.h ip4.h uint16.h socket.h uint16.h fd.h stralloc.h \
gen_alloc.h buffer.h error.h strerr.h pathexec.h timeoutconn.h \
uint16.h remoteinfo.h stralloc.h uint16.h dns.h stralloc.h iopause.h \
taia.h tai.h uint64.h taia.h uint32.h
	./compile tcpclient.c

tcprules: \
load tcprules.o cdb.a unix.a byte.a
	./load tcprules cdb.a unix.a byte.a 

tcprules.o: \
compile tcprules.c strerr.h stralloc.h gen_alloc.h getln.h buffer.h \
stralloc.h buffer.h exit.h fmt.h byte.h cdb_make.h buffer.h uint32.h ip4_bit.h ip6.h
	./compile tcprules.c

tcprulescheck: \
load tcprulescheck.o rules.o cdb.a unix.a byte.a
	./load tcprulescheck rules.o cdb.a unix.a byte.a 

tcprulescheck.o: \
compile tcprulescheck.c byte.h buffer.h strerr.h env.h rules.h ip4_bit.h ip6.h \
stralloc.h gen_alloc.h
	./compile tcprulescheck.c

tcpserver: \
load tcpserver.o rules.o remoteinfo6.o timeoutconn6.o cdb.a dns.a \
time.a unix.a byte.a socket.lib
	./load tcpserver rules.o remoteinfo6.o timeoutconn6.o cdb.a \
	dns.a time.a unix.a byte.a  `cat socket.lib`

tcpserver.o: \
compile tcpserver.c uint16.h str.h byte.h fmt.h scan.h ip4.h fd.h \
exit.h env.h prot.h open.h wait.h readwrite.h stralloc.h gen_alloc.h \
alloc.h buffer.h error.h strerr.h sgetopt.h subgetopt.h pathexec.h \
socket.h uint16.h ndelay.h remoteinfo.h stralloc.h uint16.h rules.h \
stralloc.h sig.h dns.h stralloc.h iopause.h taia.h tai.h uint64.h \
taia.h uint32.h
	./compile tcpserver.c

time.a: \
makelib iopause.o tai_pack.o taia_add.o taia_approx.o taia_frac.o \
taia_less.o taia_now.o taia_pack.o taia_sub.o taia_uint.o
	./makelib time.a iopause.o tai_pack.o taia_add.o \
	taia_approx.o taia_frac.o taia_less.o taia_now.o \
	taia_pack.o taia_sub.o taia_uint.o

timeoutconn.o: \
compile timeoutconn.c ndelay.h socket.h uint16.h iopause.h taia.h \
tai.h uint64.h error.h timeoutconn.h uint16.h uint32.h
	./compile timeoutconn.c

timeoutconn6.o: \
compile timeoutconn6.c ndelay.h socket.h uint16.h iopause.h taia.h \
tai.h uint64.h error.h timeoutconn.h uint16.h uint32.h
	./compile timeoutconn6.c

uint16_pack.o: \
compile uint16_pack.c uint16.h
	./compile uint16_pack.c

uint16_unpack.o: \
compile uint16_unpack.c uint16.h
	./compile uint16_unpack.c

uint32.h: \
tryulong32.c compile load uint32.h1 uint32.h2
	( ( ./compile tryulong32.c && ./load tryulong32 && \
	./tryulong32 ) >/dev/null 2>&1 \
	&& cat uint32.h2 || cat uint32.h1 ) > uint32.h
	rm -f tryulong32.o tryulong32

uint32_pack.o: \
compile uint32_pack.c uint32.h
	./compile uint32_pack.c

uint32_unpack.o: \
compile uint32_unpack.c uint32.h
	./compile uint32_unpack.c

uint64.h: \
choose compile load tryulong64.c uint64.h1 uint64.h2
	./choose clr tryulong64 uint64.h1 uint64.h2 > uint64.h

unix.a: \
makelib alloc.o alloc_re.o buffer.o buffer_0.o buffer_1.o buffer_2.o \
buffer_copy.o buffer_get.o buffer_put.o env.o error.o error_str.o \
fd_copy.o fd_move.o getln.o getln2.o ndelay_off.o ndelay_on.o \
open_read.o open_trunc.o open_write.o openreadclose.o pathexec_env.o \
pathexec_run.o prot.o readclose.o seek_set.o sgetopt.o sig.o \
sig_block.o sig_catch.o sig_pause.o socket_accept.o socket_bind.o \
socket_conn.o socket_delay.o socket_listen.o socket_local.o \
socket_opts.o socket_remote.o socket_tcp.o socket_udp.o \
stralloc_cat.o stralloc_catb.o stralloc_cats.o stralloc_copy.o \
stralloc_eady.o stralloc_opyb.o stralloc_opys.o stralloc_pend.o \
strerr_die.o strerr_sys.o subgetopt.o wait_nohang.o wait_pid.o \
ip4_bit.o ip6_bit.o hexconversion.o \
socket_conn6.o socket_bind6.o socket_accept6.o socket_recv6.o \
socket_send6.o socket_local6.o socket_remote6.o socket_tcp6.o \
socket_getifname.o socket_getifidx.o socket_v4mappedprefix.o \
socket_ip4loopback.o socket_v6any.o socket_v6loopback.o \
socket_udp6.o socket_opts6.o
	./makelib unix.a alloc.o alloc_re.o buffer.o buffer_0.o \
	buffer_1.o buffer_2.o buffer_copy.o buffer_get.o \
	buffer_put.o env.o error.o error_str.o fd_copy.o fd_move.o \
	getln.o getln2.o ndelay_off.o ndelay_on.o open_read.o \
	open_trunc.o open_write.o openreadclose.o pathexec_env.o \
	pathexec_run.o prot.o readclose.o seek_set.o sgetopt.o \
	sig.o sig_block.o sig_catch.o sig_pause.o socket_accept.o \
	socket_bind.o socket_conn.o socket_delay.o socket_listen.o \
	socket_local.o socket_opts.o socket_remote.o socket_tcp.o \
	socket_udp.o stralloc_cat.o stralloc_catb.o stralloc_cats.o \
	stralloc_copy.o stralloc_eady.o stralloc_opyb.o \
	stralloc_opys.o stralloc_pend.o strerr_die.o strerr_sys.o \
	subgetopt.o wait_nohang.o wait_pid.o socket_conn6.o \
	ip4_bit.o ip6_bit.o hexconversion.o \
	socket_bind6.o socket_accept6.o socket_recv6.o socket_send6.o \
	socket_local6.o socket_remote6.o socket_tcp6.o \
	socket_getifname.o socket_getifidx.o socket_v4mappedprefix.o \
	socket_ip4loopback.o socket_v6any.o socket_v6loopback.o \
	socket_udp6.o socket_opts6.o

wait_nohang.o: \
compile wait_nohang.c haswaitp.h
	./compile wait_nohang.c

wait_pid.o: \
compile wait_pid.c error.h haswaitp.h
	./compile wait_pid.c

who@: \
home warn-auto.sh who@.sh 
	rm -f who@
	cat warn-auto.sh who@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> who@
	chmod 755 who@

who4@: \
home warn-auto.sh who4@.sh 
	rm -f who4@
	cat warn-auto.sh who4@.sh \
	| sed s}HOME}"`head -1 home`"}g \
	> who4@
	chmod 755 who4@

socket_conn6.o: \
compile socket_conn6.c socket.h uint16.h haveip6.h error.h ip6.h \
uint32.h
	./compile socket_conn6.c

socket_bind6.o: \
compile socket_bind6.c socket.h uint16.h haveip6.h error.h ip6.h \
uint32.h
	./compile socket_bind6.c

socket_accept6.o: \
compile socket_accept6.c socket.h uint16.h haveip6.h error.h ip6.h \
uint32.h
	./compile socket_accept6.c

socket_recv6.o: \
compile socket_recv6.c socket.h uint16.h haveip6.h error.h ip6.h \
uint32.h
	./compile socket_recv6.c

socket_send6.o: \
compile socket_send6.c socket.h uint16.h haveip6.h error.h uint32.h
	./compile socket_send6.c

socket_local6.o: \
compile socket_local6.c socket.h uint16.h haveip6.h error.h uint32.h
	./compile socket_local6.c

socket_remote6.o: \
compile socket_remote6.c socket.h uint16.h haveip6.h error.h uint32.h
	./compile socket_remote6.c

dns_sortip6.o: \
compile dns_sortip6.c byte.h dns.h stralloc.h gen_alloc.h iopause.h \
taia.h tai.h uint64.h taia.h
	./compile dns_sortip6.c

dns_nd6.o: \
compile dns_nd6.c byte.h fmt.h dns.h stralloc.h gen_alloc.h iopause.h \
taia.h tai.h uint64.h taia.h 
	./compile dns_nd6.c

dns_ipq6.o: \
compile dns_ipq6.c stralloc.h gen_alloc.h case.h byte.h str.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h ip6.h
	./compile dns_ipq6.c

dns_ip6.o: \
compile dns_ip6.c stralloc.h gen_alloc.h uint16.h byte.h dns.h \
stralloc.h iopause.h taia.h tai.h uint64.h taia.h
	./compile dns_ip6.c

fmt_xlong.o: \
compile fmt_xlong.c scan.h hexconversion.h
	./compile fmt_xlong.c

hexconversion.o: \
compile hexconversion.c hexconversion.h
	./compile hexconversion.c

ip6_compactaddr.o: \
compile ip6_compactaddr.c fmt.h ip6.h 
	./compile ip6_compactaddr.c

ip6_expandaddr.o: \
compile ip6_expandaddr.c ip6.h stralloc.h
	./compile ip6_expandaddr.c

ip6_scan.o: \
compile ip6_scan.c scan.h ip6.h hexconversion.h
	./compile ip6_scan.c
	
ip6_bit.o: \
compile ip6_bit.c ip6.h strerr.h ip6.h byte.h str.h fmt.h hexconversion.h
	./compile ip6_bit.c

scan_xlong.o: \
compile scan_xlong.c scan.h
	./compile scan_xlong.c

socket_tcp6.o: \
compile socket_tcp6.c ndelay.h socket.h uint16.h haveip6.h uint32.h
	./compile socket_tcp6.c

socket_udp6.o: \
compile socket_udp6.c ndelay.h socket.h uint16.h haveip6.h uint32.h
	./compile socket_udp6.c

haveip6.h: \
tryip6.c choose compile haveip6.h1 haveip6.h2
	./choose c tryip6 haveip6.h1 haveip6.h2 > haveip6.h

socket_getifname.o: \
compile socket_getifname.c socket.h uint16.h uint32.h
	./compile socket_getifname.c

socket_getifidx.o: \
compile socket_getifidx.c socket.h uint16.h uint32.h
	./compile socket_getifidx.c

socket_ip4loopback.o: \
compile socket_ip4loopback.c
	./compile socket_ip4loopback.c

socket_v4mappedprefix.o: \
compile socket_v4mappedprefix.c
	./compile socket_v4mappedprefix.c

socket_v6any.o: \
compile socket_v6any.c
	./compile socket_v6any.c

socket_v6loopback.o: \
compile socket_v6loopback.c
	./compile socket_v6loopback.c

