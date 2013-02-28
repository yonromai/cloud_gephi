require 'spec_helper'
describe "Graph pages" do

  subject { page }
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "graph creation" do

    before { visit new_graph_path }

    describe "with invalid information" do
      it "should not create a graph" do
        expect { click_button "Post Graph" }.should_not change(Graph, :count)
      end

      describe "error messages" do
        before { click_button "Post Graph" }
        it { should have_content('error') }
      end 
    end

    describe "with valid information" do
      before { fill_in 'graph_name', with: "Lorem ipsum" }
      #before { fill_in 'graph_source', with: ENV['PWD'] + "/spec/resources/sample.gexf" }
      before { attach_file('graph_source', ENV['PWD'] + "/spec/resources/sample.gexf") }
      it "should create a graph" do
        expect { click_button "Post Graph" }.should change(Graph, :count).by(1)
      end
    end 
  end

  describe "graph destruction" do
    before { FactoryGirl.create(:graph, user: user) }
    describe "as correct user" do
      before { visit root_path }
      it "should delete a graph" do
        expect { click_link "delete" }.should change(Graph, :count).by(-1)
      end 
    end
  end

end