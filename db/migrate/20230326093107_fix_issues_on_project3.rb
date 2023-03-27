class FixIssuesOnProject3 < ActiveRecord::Migration[7.0]
  def change
    add_column :projects,:year,:integer
    add_column :projects,:team_num, :integer
  end
end
