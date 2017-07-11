class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title, null: false
      t.string :category, null: false
      t.string :email, null: false
      t.string :city
      t.datetime :active_to_date, null: false
      t.string :job_type
      t.string :description, null: false
      t.string :company, null: false
      t.text :tags, array: true, default: []
      t.float :price_per_hour, null: false
      t.string :website
      t.references :user, null: false

      t.timestamps
    end
  end
end
