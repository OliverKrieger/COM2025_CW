class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.belongs_to :campaign, index: true, foreign_key: true
      t.string :name, null:false
      t.string :desc

      t.timestamps
    end

  end
end
