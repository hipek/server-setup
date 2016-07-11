dep 'dnsmasq', :host do
  requires 'dnsmasq.remote_bin'.with(host),
    'dnsutils.remote_bin'.with(host)
end

dep 'dnsmasq.remote_bin', :host do
  name 'dnsmasq'
end

dep 'dnsutils.remote_bin', :host do
  name 'dnsutils'
  exe 'dig'
end
