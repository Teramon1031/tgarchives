class AddTeamNumAndRemoveTeamIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects,:team_num, :string
    remove_column :projects, :team_id, :string
  end
end

