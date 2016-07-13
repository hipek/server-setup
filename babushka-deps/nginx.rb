dep 'nginx', :host do
  requires 'nginx.remote_bin'.with(host)
end

dep 'nginx.remote_bin', :host do
  name 'nginx'
  exe 'nginx'
end
