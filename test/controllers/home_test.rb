# frozen_string_literal: true

require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'visit home page' do
    get '/'
    assert_equal 200, status
    assert_select 'h1', 'Welcome to Blog'
    assert_select 'a[href=?]', posts.first.url, { text: posts.first.title }
  end

  test 'posts are sorted by most recently updated' do
    posts_by_most_recent = Post.list_by_most_recent
    most_recent_post = posts(:thor_revolution)

    assert_equal most_recent_post, posts_by_most_recent.first
  end
end
