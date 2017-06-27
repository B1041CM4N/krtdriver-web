class Provider < ApplicationRecord
  def self.fetch(params = {})
    collection = super params
    #collection = attribute_filter(collection, 'product_id', params)
    collection
  end
end
