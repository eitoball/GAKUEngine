require 'spec_helper'

describe ClassGroup do

  context "validations" do 
  	it { should have_valid_factory(:class_group) }
  	it { should have_many :class_group_enrollments }
    it { should have_many(:students) }
  end
  
end