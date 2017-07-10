class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.string :email
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone
      t.string :user
      t.string :pass

      t.timestamps
    end
  end
end
