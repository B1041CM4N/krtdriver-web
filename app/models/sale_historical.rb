class SaleHistorical < ApplicationRecord
  self.table_name = 'salehistorical'

  belongs_to :segment, foreign_key: :segment_id, class_name: 'Segment'
  belongs_to :store, foreign_key: :store_id, class_name: 'Store'
end
