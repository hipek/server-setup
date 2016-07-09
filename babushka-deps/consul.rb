dep 'consul', :host do
  requires 'consul.cmd'.with(host),
    'consul.template'.with(host)
end

dep 'consul.cmd', :host do
  version = '0.6.4'

  ssh(host) do |r|
    met? {
      r.shell 'which consul'
    }

    meet {
      r.shell "cd /tmp && wget https://releases.hashicorp.com/consul/"\
              "#{version}/consul_#{version}_linux_amd64.zip"
      r.shell 'cd /tmp && unzip consul*.zip && cp consul /usr/local/bin'
    }
  end
end

dep 'consul.template', :host do

end
