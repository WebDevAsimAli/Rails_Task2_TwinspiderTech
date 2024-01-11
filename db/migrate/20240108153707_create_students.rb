class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :major
      t.decimal :gpa
      t.integer :year_of_graduation
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
