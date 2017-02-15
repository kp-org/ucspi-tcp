echo "${2-}" | HOME/bin/tcpclient -4RHl0 -- "${1-0}" 79 sh -c '
  HOME/bin/addcr >&7
  exec HOME/command/delcr <&6
' | cat -v
