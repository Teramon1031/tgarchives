class ConvertYearAndNumToIntInProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects,:year,:string
    remove_column :projects,:team_num, :string
  end
end
