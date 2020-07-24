class AddSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.integer :position
      t.jsonb :contents, null: false, default: '{}'
      t.timestamps
    end
  end
end
