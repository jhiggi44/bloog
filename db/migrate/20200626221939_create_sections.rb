class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :type
      t.integer :position
      t.text :content
      t.timestamps
    end
  end
end
