# frozen_string_literal: true

require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  test 'new' do
  end

  test 'create post with multiple sections' do
    user = users(:thor)
    params = {
      user_id: user.id,
      post: { title: "A Title", sections: [{ type: "text", value: "A section's text" }, { type: "text", value: "Another section's text." }] }
    }

    assert_difference ->{ Post.count } => 1, ->{ Section.count } => 2 do
      post "/users/#{user.id}/posts", params: params
    end
  end

  test 'show' do
    user = users(:thor)
    post = posts(:thor_hero)
    quote_section = post.sections[2]

    get "/users/#{user.id}/posts/#{post.id}"
    assert_select 'h2', post.title
    assert_select 'h4', "By: #{user.name}"
    assert_select 'h3', post.sections.first.contents["text"]
    assert_select 'p', post.sections.second.contents["text"]

    assert_select "p", quote_section.contents["quote"]
    assert_select "blockquote[cite=?]", quote_section.contents["source"]
    assert_select 'a[href=?]', quote_section.contents["source"], { text: quote_section.contents["author"] }
  end
end
