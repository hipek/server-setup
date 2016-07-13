meta :start do
  accepts_value_for :name, :basename

  template {
    met? {
      ssh(host).shell "pidof #{name}"
    }

    meet {
      ssh(host).shell "/etc/init.d/#{name} restart"
    }
  }
end
