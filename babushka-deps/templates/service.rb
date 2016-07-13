meta :service do
  accepts_value_for :name, :basename

  template {
    met? { ssh(host).shell "ls" }
    meet { ssh(host).shell "ls" }
  }
end
