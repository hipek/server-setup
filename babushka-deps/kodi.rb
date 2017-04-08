dep 'kodi', :host do
  met? {
    ssh(host).shell 'which kodi'
  }

  meet {
    ssh(host) do |r|
      r.shell "add-apt-repository ppa:team-xbmc/ppa && "\
              "apt-get update && apt-get install kodi -yy > /dev/null"
    end
  }
end

dep 'lightdm.remote_bin', :host
