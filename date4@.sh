HOME/bin/tcpclient -4RHl0 -- "${1-0}" 13 sh -c 'exec HOME/command/delcr <&6' | cat -v
