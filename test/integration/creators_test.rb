# frozen_string_literal: true

require 'test_helper'

class CreatorsTest < ActionDispatch::IntegrationTest
  test "create draft as creator" do
    creator = creator(:thor)
    get "/creators/#{creator[:id]}"
    assert_equal 200, status
    assert_select "h1", "Hello #{creator[:name]}"

    get "/creators/#{creator[:id]}/drafts/new"
    assert_select "h1", "New Draft"
    assert_equal 200, status

    post "/creators/#{123}/drafts", params: { title: "A Title", content: "Some good content." }
    follow_redirect!
    assert_equal 200, status
    assert_equal "/creators/#{creator[:id]}", path
  end
end