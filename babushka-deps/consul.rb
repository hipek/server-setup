dep 'consul', :host do
  requires 'consul.hashicorp'.with(host),
    'consul-template.hashicorp'.with(host),
    'consul.init'.with(host),
    'consul-template.init'.with(host),
    'consul-template.conf'.with(host),
    'consul-templates.conf'.with(host)
end

dep 'consul.hashicorp', :host do
  version '0.6.4'
  name 'consul'
end

dep 'consul-template.hashicorp', :host do
  version '0.15.0'
  name 'consul-template'
end

dep 'consul.init', :host do
  ip = host.to_s.split('@').last
  name 'consul'
  params "agent -server -data-dir /tmp/consul -bootstrap -ui -bind #{ip} -advertise=#{ip}"
end

dep 'consul-template.init', :host do
  name 'consul-template'
  params '-config /etc/consul-template'
end

dep 'consul-template.conf', :host do
  dir '/etc/consul-template'
  files 'consul-template/default.json',
    'consul-template/nginx-template'
end

dep 'consul-templates.conf', :host do
  dir '/etc/consul-templates'
  files 'consul-template/consul-services.conf.ctmpl'
end
