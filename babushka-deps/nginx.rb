dep 'nginx', :host do
  requires 'nginx.remote_bin'.with(host),
    'nginx.service'.with(host)
end

dep 'nginx.remote_bin', :host do
  name 'nginx'
  exe 'nginx'
end

dep 'nginx.service', :host do
  name 'nginx'
end
