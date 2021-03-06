class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :firstname
      t.string :lastname
      t.date :birthday
      t.string :email
      t.text :publickey

      t.timestamps
    end
  end
end
