# == Schema Information
#
# Table name: films
#
#  id                :bigint(8)        not null, primary key
#  title             :string
#  description       :text
#  short_description :text
#  duration          :integer
#  release           :date
#  production        :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Film < ApplicationRecord
  serialize :production, Array

  validates :title, presence: true, length: { maximum: 50 }
  validates :short_description, length: { maximum: 200 }

  has_and_belongs_to_many :genres
  has_many :employments
  has_many :people, through: :employments
  has_many :actors, -> { Employment.as_actor }, class_name: 'Employment'
  has_many :directors, -> { Employment.as_director }, through: :employments, source: :person
  has_many :screenwriters, -> { Employment.as_screenwriter }, through: :employments, source: :person

  has_many :news
  has_many :reviews

  def year
    self.release.year
  end

  def average_rating
    reviews.average(:rating).to_f.round(1)
	end

  def self.recent
    Film.order(release: :desc).last(5)
  end
end
