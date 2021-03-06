# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_student)
      # @return_array = []
      # self.all.each do |student|
      #   if student.name.match(/#{search_student}/i)
      #       @return_array << student
      #   end
      # end
      # @return_array
      Student.where("name LIKE ?", "%#{search_student}%")
  end
end
