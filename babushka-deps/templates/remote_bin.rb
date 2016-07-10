meta :remote_bin do
  accepts_value_for :name
  accepts_value_for :exe

  def install_cmd
    "apt-get update && apt-get install"
  end

  template {
    met? { ssh(host).shell "which #{exe || name}" }
    meet { ssh(host).shell "#{install_cmd} #{name} -yy" }
  }
end
