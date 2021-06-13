class CreatePasswords < ActiveRecord::Migration[6.1]
  def change
    create_table :passwords do |t|
      t.string :password
      t.boolean :isvalid?

      t.timestamps
    end
  end
end
