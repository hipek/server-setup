dep 'tools', :host do
  requires 'lsb_release.remote_bin'.with(host),
    'unzip.remote_bin'.with(host)
end

dep 'lsb_release.remote_bin', :host do
  name 'lsb-release'
  exe 'lsb_release'
end

dep 'unzip.remote_bin', :host do
  name 'unzip'
end
