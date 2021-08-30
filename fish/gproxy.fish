function gproxy
  ssh -f -nNT gitproxy
end

function gproxy-status
  ssh -O check gitproxy
end

function gproxy-off
  ssh -O exit gitproxy
end
