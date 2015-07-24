directservers=(server1 server2 server3 server4 server5)
found=false

function skippass() {
  # TODO: Better way to implement 'contains in an array'
  for item in "${directservers[@]}"; do
    if [[ $1 = "$item" ]] ;
    then
      sshpass -p 'password' ssh username@$1
      found=true
      break
    fi
  done

  if [ "$found" = false ];
  then
      sshpass -p 'password' ssh -t username@server1 "sshpass -p 'password' ssh username@$1"
  fi
}

alias s='skippass'

alias server1='sshpass -p '"'"'password'"'"' ssh username@server1'
