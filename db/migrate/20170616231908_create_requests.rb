class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :request_category_id
      t.integer :consumer_id
      t.integer :provider_id
      t.string :message

      t.timestamps
    end
  end
end
