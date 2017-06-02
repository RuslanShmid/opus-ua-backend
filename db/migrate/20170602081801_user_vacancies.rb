class UserVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table(:user_vacancies) do |t|
      t.integer :user_id, :null => false
      t.integer :vacancy_id, :null => false
      t.boolean :creator, :null => false, :default => false
    end
  end
end
