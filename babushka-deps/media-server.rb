dep 'media-server', :host do
  requires 'tools'.with(host),
    'lightdm.remote_bin'.with(host),
    'lubuntu'.with(host)
    'kodi'.with(host)
end
