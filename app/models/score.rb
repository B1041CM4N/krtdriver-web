# == Schema Information
#
# Table name: score
#
#  id            :integer          not null, primary key
#  punishment_id :integer
#  consumer_id   :integer
#  provider_id   :integer
#  puntuation    :integer
#  comment       :string(70)
#  suggest       :string(70)
#  claim         :string(70)
#
# Indexes
#
#  FK_Score_Consumer    (consumer_id)
#  FK_Score_Provider    (provider_id)
#  FK_Score_Punishment  (punishment_id)
#
# Foreign Keys
#
#  FK_Score_Consumer    (consumer_id => consumer.id)
#  FK_Score_Provider    (provider_id => provider.id)
#  FK_Score_Punishment  (punishment_id => punishment.id)
#

class Score < ApplicationRecord
  self.table_name = 'score'
  self.primary_key = 'score_id'
end
