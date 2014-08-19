class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|

      t.string :title
      t.boolean :public
      t.text :code
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
