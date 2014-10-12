class ChangeColumPublishedAt < ActiveRecord::Migration
  def change
    change_column(:recipes, :published_at, :datetime)
  end
end
