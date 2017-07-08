# == Schema Information
#
# Table name: segment
#
#  segment_id :integer          not null, primary key
#  amount     :integer
#  commission :decimal(4, 2)
#

class Segment < ApplicationRecord
  self.table_name = 'segment'
  self.primary_key = 'segment_id'
end
