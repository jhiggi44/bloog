# frozen_string_literal: true

require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test 'visit home page' do
    get '/'
    assert_equal 200, status
    assert_select 'h1', 'Welcome to Blog'
  end
end
