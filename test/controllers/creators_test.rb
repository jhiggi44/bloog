# frozen_string_literal: true

require 'test_helper'

class CreatorsTest < ActionDispatch::IntegrationTest
  test "index" do
    creator = creator(:thor)
    get "/creators/#{creator[:id]}"
    assert_equal 200, status
    assert_select "h1", "Hello #{creator[:name]}"
  end

  test "new" do
    creator = creator(:thor)
    get "/creators/#{creator[:id]}/posts/new"

    assert_equal 200, status

    assert_select "label", "Title" do
      assert_select 'input#title'
    end

    assert_select "label", "Content" do
      assert_select 'textarea#content'
    end

    assert_select "input[value=?]", "Create Post"
  end

  test "create" do
    creator = creator(:thor)
    post "/creators/#{creator[:id]}/posts", params: { title: "A Title", content: "Some good content." }
    follow_redirect!
    assert_equal 200, status
    assert_equal "/creators/#{creator[:id]}", path
  end
end