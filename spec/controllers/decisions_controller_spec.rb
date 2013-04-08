require 'spec_helper'

describe DecisionsController do

  describe 'GET #index' do
    let!(:decisions) { 2.times.map { FactoryGirl.create :decision } }
    before { get :index }
    
    it "loads decisions ordered by created_at desc" do
      assigns(:decisions).should eq decisions.sort_by(&:created_at).reverse
    end
  end
end
