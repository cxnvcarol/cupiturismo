class Trip < ActiveRecord::Base

  validates :tittle, presence: true,
              length: { minimum: 2 }
  validates :begin_date, presence: true

  validates :user_id, presence: true

  belongs_to :user
  has_many :trip_cities
  has_many :photos
  accepts_nested_attributes_for :photos,:trip_cities, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |_, v| v.blank? } }
  end
