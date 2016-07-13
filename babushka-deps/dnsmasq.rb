dep 'dnsmasq', :host do
  requires 'dnsmasq.remote_bin'.with(host),
    'dnsmasq.conf'.with(host),
    'dnsmasq.load_conf.d'.with(host),
    'dnsutils.remote_bin'.with(host)
end

dep 'dnsmasq.remote_bin', :host

dep 'dnsutils.remote_bin', :host do
  exe 'dig'
end

dep 'dnsmasq.conf', :host do
  dir '/etc/dnsmasq.d'
  files 'dnsmasq/10-consul'
end

dep 'dnsmasq.load_conf.d', :host do
  ssh(host) do |r|
    met? {
      r.shell 'cat /etc/dnsmasq.conf | grep "^conf-dir=/etc/dnsmasq.d"'
    }

    meet {
      r.shell "echo '\nconf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf"
      r.shell "/etc/init.d/dnsmasq restart"
    }
  end
end
