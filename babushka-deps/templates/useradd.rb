meta :useradd do
  accepts_value_for :name, :basename

  template {
    met? {
      ssh(host).shell "cat /etc/passwd | grep #{name}"
    }

    meet {
      ssh(host).shell "useradd -m -s /bin/bash #{name}"
    }
  }
end
