#ifndef BYTE_H
#define BYTE_H

extern unsigned int byte_chr(char *,unsigned int,int);
extern unsigned int byte_rchr(char *,unsigned int,int);
extern void byte_copy(char *,unsigned int,const char *);
extern void byte_copyr(char *,unsigned int,char *);
extern void byte_zero(void *,unsigned int);

extern int byte_diff(const char *,unsigned int,const char *);
#define byte_equal(s,n,t) (!byte_diff((s),(n),(t)))

#endif
