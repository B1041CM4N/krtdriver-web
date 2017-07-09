# == Schema Information
#
# Table name: segment
#
#  segment_id :integer          not null, primary key
#  amount     :integer
#  comission  :decimal(4, 2)
#

class Segment < ApplicationRecord
  self.table_name = 'segment'
  self.primary_key = 'segment_id'

  has_many :sale_historicals, class_name: 'SaleHistorical'
end
