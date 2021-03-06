class ClassGroup < ActiveRecord::Base
  has_many :class_group_enrollments
  has_many :students, :through => :class_group_enrollments
  attr_accessible :name
end