class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :team_id
      t.string :app_name
      t.string :team_name
      t.string :pitch_video
      t.string :demo_video
      t.string :business_plan
      t.string :journey
      t.integer :member_num
      t.string :year
      t.string :prize
      t.integer :semifinal
      t.integer :final

      t.timestamps
    end
  end
end
