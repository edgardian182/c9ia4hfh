# == Schema Information
#
# Table name: rooms
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  beds        :integer
#  guests      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_url   :string
#

class Room < ActiveRecord::Base

  validates :title, :description, :beds, :guests, :image_url, presence: true
  validates_length_of :description, maximum: 400
  validates :beds, :guests, numericality: true
  # Forma alterna
  # validates :beds,numericality: {only_integer: true}

end
