dep 'jenkins.meteor', :host do
  def user
    'jenkins'
  end

  ssh(host) do |r|
    met? {
      r.shell "su - #{user} -c 'ls .meteor'"
    }

    meet {
      r.shell "su - #{user} -c 'curl https://install.meteor.com/ | sh'"
    }
  end
end
