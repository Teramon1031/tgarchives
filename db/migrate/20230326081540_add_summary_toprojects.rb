class AddSummaryToprojects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects,:summary,:text
  end
end
