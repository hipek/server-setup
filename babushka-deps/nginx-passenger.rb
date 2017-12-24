dep 'nginx-passenger', :host do
  requires 'passenger.source'.with(host, 'stretch'),
           'passenger.remote_bin'.with(host),
           'nginx.remote_bin'.with(host)
end

dep 'passenger.source', :host, :distro do
  met? {
    ssh(host).shell 'cat /etc/apt/sources.list.d/passenger.list'
  }

  meet {
    ssh(host) do |r|
      r.shell 'apt-get install -y dirmngr gnupg'
      r.shell 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7'
      r.shell 'apt-get install -y apt-transport-https ca-certificates'
      r.shell "echo 'deb https://oss-binaries.phusionpassenger.com/apt/passenger #{distro} main' > /etc/apt/sources.list.d/passenger.list"
    end
  }
end

dep 'passenger.remote_bin', :host do
  name 'libnginx-mod-http-passenger'
end
