require 'spec_helper'

describe "User pages" do
  let(:base_title) { "Cloud Gephi" }
  subject { page }
  describe "signup page" do
    before { visit signup_path }
    it {page.should have_selector('title', text: "#{base_title} | Sign Up")}
  end 
end