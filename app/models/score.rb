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

class Score < ApplicationRecord
  self.table_name = 'score'
  self.primary_key = 'score_id'

  belongs_to :punishment, foreign_key: 'punishment_id', class_name: 'Punishment'
  belongs_to :consumer, foreign_key: 'consumer_id', class_name: 'Consumer'
  belongs_to :store, foreign_key: 'store_id', class_name: 'Store'
end
