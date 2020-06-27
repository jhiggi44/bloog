require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "post can have many sections" do
   post = posts(:peter_post_gwen)

   pp post.sections

   assert_equal post.sections.count, 3
  end
end