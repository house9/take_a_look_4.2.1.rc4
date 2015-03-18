require 'test_helper'

class FooTest < ActiveSupport::TestCase
  test "saves serialized hash with data" do
    bar = { x: "X" }
    assert Foo.new(title: "the-title", bar: bar).save
  end

  test "saves serialized empty hash" do
    bar = {}
    foo = Foo.new(title: "the-title", bar: bar)
    assert foo.bar == {}
    assert foo.save # BOOM! SQLite3::ConstraintException: NOT NULL constraint failed: foos.bar
  end

  test "cannot save without bar" do
    bar = nil

    assert_raises ActiveRecord::StatementInvalid  do
      # really SQLite3::ConstraintException
      Foo.new(title: "the-title", bar: bar).save
    end
  end
end
