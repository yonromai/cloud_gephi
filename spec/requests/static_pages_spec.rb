require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "Cloud Gephi" }

  describe "Home Page" do
    it "should respond" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/'
      response.status.should be(200)
    end
    it 'should have a reference to Gephi.org' do
      visit '/'
      page.should have_content('Gephi.org')
    end
    it 'should have the right title' do
      visit '/'
      page.should have_selector('title', :text => "#{base_title}")
    end
  end

  describe "Help page" do
    it 'should have a reference to Gephi.org' do
      visit '/help'
      page.should have_content('Gephi.org')
    end
    it 'should have the right title' do
      visit '/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end

  end

  describe "About page" do
    it 'should have a reference to Gephi.org' do
      visit '/about'
      page.should have_content('Gephi.org')
    end
    it 'should have the right title' do
      visit '/about'
      page.should have_selector('title', :text => "#{base_title} | About Us")
    end
  end

  describe "Contact page" do
    it 'should have a reference to Gephi.org' do
      visit '/contact'
      page.should have_content('Gephi.org')
    end
    it 'should have the right title' do
      visit '/contact'
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end
end
