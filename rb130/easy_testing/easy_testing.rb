require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class MyTest < MiniTest::Test
  
  def setup
    @value = 3
    @list = [1, 2, 3]
  end

  def test_odd
    assert(@value.odd?)
  end

  def test_equal
    assert_equal('xyz', @value.downcase)
  end

  def test_nil
    assert_nil(@value, "@value is not nil")
  end

  def test_empty
    assert_empty(@list)
  end

  def test_inclusion
    assert_includes(@list, 'xyz')
  end

  def test_exception
    assert_raises(NoExperienceError) do
      employee.hire
    end
  end

  def test_subclass
    assert_kind_of(@value, Numeric)
  end

  def test_same_object
    assert_same(list, list.process)
  end

  def test_not_element
    refute_includes(@list, 'xyz')
  end
end