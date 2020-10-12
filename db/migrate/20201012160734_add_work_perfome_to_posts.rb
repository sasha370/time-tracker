class AddWorkPerfomeToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :rationale, :work_perform
  end
end
