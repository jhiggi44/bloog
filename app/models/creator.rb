# frozen_string_literal: true

class Creator < ActiveRecord::Base
  has_many :posts
end
