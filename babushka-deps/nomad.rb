dep 'nomad', :host do
  requires 'nomad.hashicorp'.with(host),
    'nomad.init'.with(host),
    'nomad.start'.with(host)
end

dep 'nomad.hashicorp', :host do
  version '0.4.0'
end

dep 'nomad.init', :host do
  ip = '127.0.0.1'
  params "agent -dev -bind=#{ip} -network-interface=eth0"
end

dep 'nomad.start', :host
