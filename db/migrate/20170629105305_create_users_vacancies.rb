class CreateUsersVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :users_vacancies do |t|
      t.references :user
      t.references :vacancy, null: false
      t.boolean :creator, null: false, default: false
      t.string :email, null: false
      t.string :full_name, null: false
      t.string :description, null: false
      t.string :filename
      t.string :content_type
      t.binary :file_contents

      t.timestamps
    end
  end
end
