class Dependency
  attr_accessor :name, :blk, :commands

  def initialize(name, &blk)
    @name = name
    @blk = blk
    @commands = []
  end

  def shell(cmd)
    @commands << cmd
  end

  def install(name)
    "apt-get install -y #{name}"
  end

  def installs(name)
    @meet = install name
  end

  def provides(name)
    @met = "which #{name}"
  end

  def meet(&blk)
    @neet = blk.call
  end

  def met?(&blk)
    @met = blk.call
  end

  def dep_meet(context)
    context.capture @meet
  end

  def dep_met?(context)
    context.capture @met
  rescue Exception
    false
  end
end

def dep(name, &blk)
  unless block_given?
    blk = ->(blk) do
      installs name
      provides name
    end
  end

  d = Dependency.new(name, &blk)
  d.instance_eval(&blk)

  task d.name do
    on roles :all do
      if d.dep_met?(self)
        puts "Dep '#{d.name}' ok"
      else
        puts "Dep installing '#{d.name}'..."
        d.dep_meet(self)
        if d.dep_met?(self)
          puts "Dep '#{d.name}' ok"
        else
          raise "Dep '#{d.name}' not meet"
        end
      end
    end
  end
end
