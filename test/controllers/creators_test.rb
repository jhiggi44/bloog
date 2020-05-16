# frozen_string_literal: true

require 'test_helper'

class CreatorsTest < ActionDispatch::IntegrationTest
  test 'index' do
    get '/creators'
    assert_equal 200, status
    assert_select 'h1', 'Creator Needs To Login'
  end

  test 'show' do
    creator = creator(:peter_parker)
    get "/creators/#{creator[:id]}"
    assert_equal 200, status
    assert_select 'h1', creator[:name]

    creator.posts.each do |post|
      assert_select 'h3', post.title do
        assert_select 'a[href=?]', "/creators/#{creator[:id]}/posts/#{post.id}"
      end
    end

    assert_select 'a', 'Write New Post' do
      assert_select 'a[href=?]', "/creators/#{creator[:id]}/posts/new"
    end
  end
end
