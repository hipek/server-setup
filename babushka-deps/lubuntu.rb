dep 'lubuntu', :host do
  met? {
    ssh(host).shell 'which lxsession'
  }

  meet {
    ssh(host) do |r|
      r.shell "apt-get install --no-install-recommends lubuntu-desktop -yy"
    end
  }
end
