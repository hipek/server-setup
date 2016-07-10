dep 'setup', :host do
  requires 'tools'.with(host),
    'consul'.with(host),
    'nomad'.with(host),
    'docker'.with(host)
end

dep 'setup.home' do
  requires 'setup'.with 'root@192.168.56.101'
end
