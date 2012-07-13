require 'spec_helper'

describe "HomePages" do

  let(:base_title) { "Cloud Gephi" }
  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { page.should have_content('Gephi.org') }
    it {page.should have_selector('title', text: "#{base_title}")}

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:graph, user: user, description: "Lorem ipsum")
        FactoryGirl.create(:graph, user: user, description: "Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.description)
        end
      end 
    end

  end
end
