class Event < ActiveRecord::Base
  belongs_to :trip_city
  has_one :place
  validates :begin_date, presence: true

    validates :description, presence: true,
            length: { minimum: 5 }

  validates :end_date, presence: true

  validates :name, presence: true,
            length: { minimum: 5 }

  #validates :picture_link, :picture_link => true

end
