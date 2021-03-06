require 'spec_helper'

describe NotesController do

  let(:note) { FactoryGirl.build_stubbed(:note) }

  before do
    login_admin
  end

  describe "GET :index	" do
    it "should be successful" do
      get :index
      response.should be_success
    end
  end 
end
