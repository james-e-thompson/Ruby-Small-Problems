module Walkable
  def walk
    "#{full_name} #{gait} forward."
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def full_name
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title, :full_name

  include Walkable

  def initialize(name, title)
    @title = title
    @name = name
    @full_name = title + ' ' + name
  end

  # making a different name method like this is confusing because it's not a getter for name (we'd also remove
  # the attr_reader above.) However, it would mean that we wouldn't have to define full_name for all the other
  # classes

=begin
  def name
    @full_name
  end
=end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk

# Whether this is a good idea seems to depend on whether we want to_s to yield something different in other
# contexts, such as when we supply print with an instance of these classes.