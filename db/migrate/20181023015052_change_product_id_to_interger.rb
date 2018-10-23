class ChangeProductIdToInterger < ActiveRecord::Migration[5.2]
  def change
    change_column :images, :product_id, "numeric USING CAST(product_id AS numeric)"
  end
end
