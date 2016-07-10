require_relative '../../lib/file_sha1'

meta :init do
  accepts_value_for :name

  def init_path
    '/etc/init.d'
  end

  def init_template_path
    'templates/init/template.erb'
  end

  def temp_path
    "tmp/#{name}"
  end

  def read_sha1
    FileSha1.read temp_path
  end

  template {
    met? {
      render_erb init_template_path, :to => temp_path
      log "Checking file #{init_path}/#{name}"
      ssh(host).shell "cat #{init_path}/#{name} | grep '#{read_sha1}' > /dev/null"
    }

    meet {
      `scp #{temp_path} #{host}:#{init_path}`
      ssh(host).shell "chmod 755 #{init_path}/#{name}"
      log "New file #{init_path}/#{name} uploaded"
    }
  }
end
