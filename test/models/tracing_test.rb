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

require 'test_helper'

class TracingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
