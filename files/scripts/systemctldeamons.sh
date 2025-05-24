#warp 
systemctl enable warp-svc.service
#scx 
systemctl disable scx.service && systemctl enable scx_loader.service
#tailscale
systemctl enable tailscaled.service