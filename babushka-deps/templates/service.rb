meta :service do
  accepts_value_for :name

  template {
    met? { ssh(host).shell "ls" }
    meet { ssh(host).shell "ls" }
  }
end
