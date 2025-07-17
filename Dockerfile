FROM tailscale/tailscale

CMD sh -c "\
  tailscaled --tun=userspace-networking --state=mem: & \
  sleep 3 && \
  tailscale up --authkey=$TAILSCALE_AUTHKEY \
               --hostname=railway-exit-node \
               --advertise-exit-node && \
  tail -f /dev/null"
