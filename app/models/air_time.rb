class AirTime < ApplicationRecord
  belongs_to :sample #テスト中

  validates :sample_id, :date, :start_t, :end_t. :onair_t, presence: true

end
