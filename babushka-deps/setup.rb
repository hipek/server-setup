dep 'setup', :host do
  requires 'tools'.with(host),
    'nginx.remote_bin'.with(host),
    'nginx.service'.with(host),
    'consul'.with(host),
    'nomad'.with(host)
end

dep 'setup.home' do
  requires 'setup'.with 'root@192.168.56.101'
end
