class Foo < ActiveRecord::Base
  serialize :bar, Hash
  serialize :baz, Hash
end
