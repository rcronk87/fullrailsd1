class CreatePhones < ActiveRecord::Migration[5.1]
  def change
    create_table :phones do |t|
      t.string :cphone
      t.string :hphone
      t.string :wphone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
