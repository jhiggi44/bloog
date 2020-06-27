# frozen_string_literal: true

require 'test_helper'

class PostsTest < ActionDispatch::IntegrationTest
  test 'show' do
    post = posts(:thor_hero)
    get "/posts/#{post.id}"

    text_section = post.sections.first
    quote_section = post.sections.second

    assert_select "h2", post.title
    assert_select "p", text_section.contents["text"]
    assert_select "p", quote_section.contents["quote"]
    assert_select "blockquote[cite=?]", quote_section.contents["source"]
    assert_select 'a[href=?]', quote_section.contents["source"], { text: quote_section.contents["author"] }
  end
end
