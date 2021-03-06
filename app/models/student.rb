class Student < ActiveRecord::Base
  has_many :course_enrollments
  has_many :courses, :through => :course_enrollments

  has_many :class_group_enrollments
  has_many :class_groups, :through => :class_group_enrollments

  #FIXME maybe it should be reversed
  has_many :exam_scores
  has_many :exams, :through => :exam_scores

  belongs_to :user
  belongs_to :profile
  has_and_belongs_to_many :addresses
  has_many :contacts
  has_many :notes

  attr_accessible :name, :address, :phone, :email, :birth, :admitted, :graduated, :class_groups
end