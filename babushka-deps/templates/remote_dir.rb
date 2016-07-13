meta :remote_dir do
  accepts_value_for :name, :basename

  template {
    met? {
      ssh(host).shell "ls #{name}"
    }

    meet {
      ssh(host).shell "mkdir -p #{name}"
    }
  }
end
