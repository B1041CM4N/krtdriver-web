# == Schema Information
#
# Table name: tracking
#
#  sesion      :string(10)       not null, primary key
#  provider_id :integer
#  latitude    :string(20)
#  longitude   :string(20)
#  flag_purge  :integer
#
# Indexes
#
#  FK_Tracing_Provider  (provider_id)
#
# Foreign Keys
#
#  FK_Tracing_Provider  (provider_id => provider.provider_id)
#

class Tracking < ApplicationRecord
  self.table_name = 'tracking'

  belongs_to :provider, foreign_key: :provider_id, class_name: 'Provider'
end
