dep 'tools', :host do
  ssh(host) do |r|
    met? { r.shell 'which unzip' }

    meet { r.shell 'apt-get update && apt-get install unzip -yy' }
  end
end
