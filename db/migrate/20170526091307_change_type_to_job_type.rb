class ChangeTypeToJobType < ActiveRecord::Migration[5.0]
  def change
    rename_column :vacancies, :type, :job_type
  end
end
