class AddColumnShops < ActiveRecord::Migration[5.2]
  def change
    add_column :shops,:kind_id, :integer
  end
end
