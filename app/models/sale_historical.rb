# == Schema Information
#
# Table name: salehistorical
#
#  amount     :integer
#  date       :datetime
#  segment_id :integer
#  store_id   :integer
#
# Indexes
#
#  FK_Reference_38  (store_id)
#  FK_Reference_39  (segment_id)
#
# Foreign Keys
#
#  FK_Reference_38  (store_id => store.store_id)
#  FK_Reference_39  (segment_id => segment.segment_id)
#

class SaleHistorical < ApplicationRecord
  self.table_name = 'salehistorical'

  belongs_to :segment, foreign_key: :segment_id, class_name: 'Segment'
  belongs_to :store, foreign_key: :store_id, class_name: 'Store'
end
