HOME/command/tcpclient -4RHl0 -- "${1-0}" 11 sh -c 'exec HOME/command/delcr <&6' | cat -v
