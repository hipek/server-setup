meta :docker_img do
  accepts_value_for :name, :basename
  accepts_value_for :tag

  def image_name
    [name, tag].compact.join(':')
  end

  template {
    met? {
      ssh(host).shell "docker images | grep #{name}.*#{tag}"
    }

    meet {
      log "Installing docker image #{image_name}..."
      ssh(host).shell "docker pull #{image_name}"
    }
  }
end
