require 'spec_helper'

describe "HomePages" do

  let(:base_title) { "Cloud Gephi" }
  subject { page }

  describe "Home page" do

    before { visit root_path }

    it { page.should have_content('Gephi.org') }
    it {page.should have_selector('title', text: "#{base_title}")}
  end
end
