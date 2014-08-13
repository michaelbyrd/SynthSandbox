class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|

      t.text :code
      t.text :description
      t.timestamps
    end
  end
end
