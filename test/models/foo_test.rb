require 'test_helper'

class FooTest < ActiveSupport::TestCase
  test "saves serialized hash with data" do
    bar = { x: "X" }
    assert Foo.new(title: "the-title", bar: bar).save
  end

  test "saves serialized empty hash" do
    bar = {}
    assert Foo.new(title: "the-title", bar: bar).save
  end

  test "cannot save without bar" do
    bar = nil

    assert_raises do
      Foo.new(title: "the-title", bar: bar).save
    end
  end
end
