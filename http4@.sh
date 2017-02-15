echo "GET /${2-} HTTP/1.0
Host: ${1-0}:${3-80}
" | HOME/command/tcpclient -4RHl0 -- "${1-0}" "${3-80}" sh -c '
  HOME/command/addcr >&7
  exec HOME/command/delcr <&6
' | awk '/^$/ { body=1; next } { if (body) print }'
