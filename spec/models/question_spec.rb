require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.create!(title: "New question title", body: "New question", resolved: false) }
 
  describe "attributes" do
    it "has title and body and resolved attributes" do
      expect(question).to have_attributes(title: "New question title", body: "New question", resolved: false)
    end
  end
end
