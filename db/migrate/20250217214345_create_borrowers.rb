class CreateBorrowers < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowers do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
