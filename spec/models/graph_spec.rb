require 'spec_helper'

describe Graph do
  let(:user) { FactoryGirl.create(:user) }

  before { @graph = user.graphs.build(
                    name: "Test Graph",
                    description: "Test Graph description",  
                    #image: "http://www.example.com/#{:user_id}/image",
                    source: File.open(ENV['PWD'] + "/spec/resources/sample.gexf"))}

  after { @graph.source.remove! }

  subject { @graph }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:source) }
  it { should respond_to(:image) }
  it { should respond_to(:user) }

  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @graph.user_id = nil }
    it { should_not be_valid }
  end

  describe "when source is not present" do
    before { @graph.source.remove! }
    it { should_not be_valid }
  end

  describe "should not have image at start" do
    its(:image) { should == nil }
  end

  # Todo: Mock image generation
  # describe "Should grab an image after a while" do
  #   its(:image) { should != nil }
  # end

  describe "with description that is too long" do
    before { @graph.description = "a" * 501 }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Graph.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
end
