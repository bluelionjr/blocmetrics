require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:test_event) { Event.create!(name: 'Named event', registered_application_id: 2) }

  describe "attributes" do
    it "has a name and registered_application_id attribute" do
      expect(test_event).to have_attributes(name: "Named event", registered_application_id: 2)
    end
  end
end
