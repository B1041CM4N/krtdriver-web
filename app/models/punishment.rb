# == Schema Information
#
# Table name: punishment
#
#  id               :integer          not null, primary key
#  reason           :string(100)
#  duration         :integer
#  denegate_service :integer
#  count            :integer
#

class Punishment < ApplicationRecord
  self.table_name = 'punishment'
  self.primary_key = 'punishment_id'
end
