class ChangeColumnIntToStr < ActiveRecord::Migration
  def change
    change_column(:recipes, :cooktime_id, :string)
    change_column(:recipes, :money_id, :string)
  end
end
