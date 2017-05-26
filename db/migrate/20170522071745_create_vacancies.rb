class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :category
      t.string :city
      t.string :street
      t.datetime :active_to_date
      t.string :type
      t.string :description
      t.string :company
      t.decimal :price_per_hour
      t.string :website
      t.timestamps
    end
  end
end
