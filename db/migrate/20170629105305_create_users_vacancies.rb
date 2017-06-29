class CreateUsersVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_vacancies do |t|
      t.integer :user_id
      t.integer :vacancy_id, null: false
      t.boolean :creator, null: false, default: false
      t.string :email, null: false
      t.string :full_name, null: false
      t.string :description, null: false
      t.string :filename, null: false
      t.string :content_type, null: false
      t.binary :file_contents, null: false

      t.timestamps
    end
  end
end
