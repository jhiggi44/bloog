require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post can have many sections" do
   post = posts(:thor_hero)

   assert_equal post.sections.count, 2
  end
end