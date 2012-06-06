require 'spec_helper'

describe "Static Pages" do

  let(:base_title) { "Cloud Gephi" }
  subject { page }

  describe "Help page" do

    before { visit help_path }

    it {page.should have_content('Gephi.org')}
    it {page.should have_selector('title', :text => "#{base_title} | Help")}

  end

  describe "About page" do

    before { visit about_path }

    it {page.should have_content('Gephi.org')}
    it {page.should have_selector('title', :text => "#{base_title} | About Us")}
  end

  describe "Contact page" do

    before { visit contact_path }

    it {page.should have_content('Gephi.org')}
    it {page.should have_selector('title', :text => "#{base_title} | Contact")}
  end
end
