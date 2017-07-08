# == Schema Information
#
# Table name: tracing
#
#  sesion      :string(10)       not null, primary key
#  consumer_id :integer
#  provider_id :integer
#  latitude    :string(20)
#  longitude   :string(20)
#  flag_Purge  :integer
#
# Indexes
#
#  FK_Tracing_Consumer  (consumer_id)
#  FK_Tracing_Provider  (provider_id)
#
# Foreign Keys
#
#  FK_Tracing_Consumer  (consumer_id => consumer.id)
#  FK_Tracing_Provider  (provider_id => provider.id)
#

class Tracking < ApplicationRecord
  self.table_name = 'tracking'

  belongs_to :provider, foreign_key: :provider_id, class_name: 'Provider'
end
