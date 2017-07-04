require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:test_app) { RegisteredApplication.create!(title: "Spec Example", url: "http://www.specexample.com", user_id: 1) }

  describe "attributes" do
    it "has title, url, and user_id attributes" do
      expect(test_app).to have_attributes(title: "Spec Example", url: "http://www.specexample.com", user_id: 1)
    end
  end
end
