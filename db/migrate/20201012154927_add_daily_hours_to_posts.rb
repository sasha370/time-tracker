class AddDailyHoursToPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :daily_hours, :daily_hours
  end
end
