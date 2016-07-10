meta :conf do
  accepts_value_for :dir
  accepts_list_for :files

  template {
    met? {
      result = nil
      ssh(host) do |r|
        result = files.all? do |fullname|
          file = File.basename fullname
          log "Checking file #{dir}/#{file}"
          r.shell "cat #{dir}/#{file} > /dev/null"
        end
      end
      result
    }

    meet {
      ssh(host).shell "mkdir -p #{dir}"
      files.each do |file|
        `scp babushka-deps/#{file} #{host}:#{dir}/#{File.basename(file)}`
        log "New file #{dir}/#{File.basename(file)} uploaded"
      end
    }
  }
end
