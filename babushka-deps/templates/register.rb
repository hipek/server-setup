meta :register do
  accepts_value_for :name, :basename
  accepts_value_for :port
  accepts_value_for :address
  accepts_list_for :tags

  def consul_host
    'http://localhost:8500'
  end

  def service_address
    address
  end

  def service
    require 'json'
    {
      "ID" => name,
      "Name" => name,
      "Tags" => tags,
      "Address" => service_address,
      "Port" => port.to_i,
      "Checks": [{
        "Name" => "alive",
        "Type" => "tcp",
        "Script" => "",
        "Path" => "",
        "Protocol" => "",
        "Interval" => "30s",
        "Timeout" => "45s"
      }]
    }
  end

  template {
    met? {
      ssh(host).shell "curl -s #{consul_host}/v1/agent/services | grep '#{name}' > /dev/null"
    }

    meet {
      log "Registering service #{name} on port #{port}"
      ssh(host).shell "curl -s -d '#{service.to_json}' #{consul_host}/v1/agent/service/register"
    }
  }
end
