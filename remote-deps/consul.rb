dep 'consul', :host do
  requires 'consul.bin'.with(host)
end

dep 'consul.bin', :host do
  ssh(host) do |r|
    met? {
      r.shell 'which consul'
    }

    meet {
      p :install_consul
    }
  end
end
