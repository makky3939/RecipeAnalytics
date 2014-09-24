class ChangeColumnReport < ActiveRecord::Migration
  def change
    change_column :reports, :posted_at, :string
  end
end
