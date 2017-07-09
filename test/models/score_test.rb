# == Schema Information
#
# Table name: score
#
#  score_id      :integer          not null, primary key
#  punishment_id :integer
#  consumer_id   :integer
#  store_id      :integer
#  puntuation    :integer
#  comment       :string(70)
#  suggest       :string(70)
#  claim         :string(70)
#
# Indexes
#
#  FK_Score_Consumer    (consumer_id)
#  FK_Score_Provider    (store_id)
#  FK_Score_Punishment  (punishment_id)
#
# Foreign Keys
#
#  FK_Score_Consumer    (consumer_id => consumer.consumer_id)
#  FK_Score_Provider    (store_id => store.store_id)
#  FK_Score_Punishment  (punishment_id => punishment.punishment_id)
#

require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
