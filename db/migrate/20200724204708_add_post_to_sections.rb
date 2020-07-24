class AddPostToSections < ActiveRecord::Migration[5.2]
  def change
    add_reference :sections, :post, foreign_key: true
  end
end
