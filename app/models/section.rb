# frozen_string_literal: true
class Section < ActiveRecord::Base
  belongs_to :post
end