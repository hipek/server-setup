dep 'consul', :host do
  requires 'consul.hashicorp'.with(host),
    'consul-template.hashicorp'.with(host),
    'consul.init'.with(host)
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
  name 'consul'
end

dep 'consul-template.init', :host do

end
