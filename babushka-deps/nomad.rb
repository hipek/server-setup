dep 'nomad', :host do
  requires 'nomad.cmd'.with(host)
end

dep 'nomad.cmd', :host do
  version = '0.4.0'

  ssh(host) do |r|
    met? {
      r.shell "which nomad && nomad -v | grep #{version}"
    }

    meet {
      r.shell "cd /tmp && wget https://releases.hashicorp.com/nomad/"\
              "#{version}/nomad_#{version}_linux_amd64.zip"
      r.shell 'cd /tmp && unzip nomad*.zip && cp nomad /usr/local/bin'
    }
  end
end
