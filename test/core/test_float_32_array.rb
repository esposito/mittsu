require 'minitest_helper'

class TestFloat32Array < Minitest::Test
  def test_initialize
    array = Mittsu::Float32Array.new(10)
    assert_equal 10, array.count
    assert_equal 10, array.size
    assert_equal 10, array.length
  end

  def test_index
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    assert_equal 1.0, array[0]
    assert_equal 2.0, array[1]
    assert_equal 3.0, array[2]
  end

  def test_index_start_end
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    assert_equal [2.0, 3.0], array[1, 2]
    assert_equal [1.0, 2.0], array[0, 2]
    assert_equal [1.0, 2.0, 3.0], array[0, 3]

    array[1, 2] = [24, 42]

    assert_equal 1.0, array[0]
    assert_equal 24, array[1]
    assert_equal 42, array[2]

    array[0, 2] = [111, 222].pack('F2')
    assert_equal 111, array[0]
    assert_equal 222, array[1]
    assert_equal 42, array[2]
  end

  def test_each
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    x = []
    array.each do |f|
      x << f
    end

    assert_equal [1.0, 2.0, 3.0], x
  end

  def test_each_without_block
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    e = array.each

    assert_equal 1.0, e.next
    assert_equal 2.0, e.next
    assert_equal 3.0, e.next
    assert_raises(StopIteration) { e.next }
  end

  def test_to_a
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    assert_equal [1.0, 2.0, 3.0], array.to_a
    assert_equal [1.0, 2.0, 3.0], array.to_ary
  end

  def test_to_s
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    assert_equal '[1.0, 2.0, 3.0]', array.to_s
  end

  def test_dup
    array = Mittsu::Float32Array.new(3)

    array[0] = 1.0
    array[1] = 2.0
    array[2] = 3.0

    array2 = array.dup

    assert_equal 1.0, array2[0]
    assert_equal 2.0, array2[1]
    assert_equal 3.0, array2[2]

    array2[1] = 42

    assert_equal 2.0, array[1]
    assert_equal 42, array2[1]
  end

  def test_from_array
    array = Mittsu::Float32Array.from_array([1.0, 2.0, 3.0])

    assert_equal 3, array.count
    assert_equal 1.0, array[0]
    assert_equal 2.0, array[1]
    assert_equal 3.0, array[2]
  end

  def test_from_string
    string = [1.0, 2.0, 3.0].pack('F3')
    array = Mittsu::Float32Array.from_string(string)

    assert_equal 3, array.count
    assert_equal 1.0, array[0]
    assert_equal 2.0, array[1]
    assert_equal 3.0, array[2]
  end
end