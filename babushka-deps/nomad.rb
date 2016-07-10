dep 'nomad', :host do
  requires 'nomad.hashicorp'.with(host),
    'nomad.init'.with(host)
end

dep 'nomad.hashicorp', :host do
  version '0.4.0'
  name 'nomad'
end

dep 'nomad.init', :host do
  name 'nomad'
end
