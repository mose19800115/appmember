class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :member_id
      t.string :password
      t.string :name
      t.string :email
      t.string :sex
      t.integer :point
      t.string :rank

      t.timestamps
    end
  end
end
