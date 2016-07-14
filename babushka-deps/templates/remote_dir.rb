meta :remote_dir do
  accepts_value_for :name, :basename
  accepts_value_for :chmod

  template {
    met? {
      ssh(host).shell "ls #{name}"
    }

    meet {
      ssh(host).shell "mkdir -p #{name}"
      ssh(host).shell "chmod #{chmod}" if chmod
    }
  }
end
