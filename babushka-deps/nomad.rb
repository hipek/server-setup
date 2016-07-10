dep 'nomad', :host do
  requires 'nomad.hashicorp'.with(host)
end

dep 'nomad.hashicorp', :host do
  version '0.4.0'
  name 'nomad'
end
