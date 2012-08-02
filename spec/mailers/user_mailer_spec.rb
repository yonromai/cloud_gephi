require "spec_helper"

describe UserMailer do
  describe "password_reset" do
    let(:user) { FactoryGirl.create(:user, password_reset_token: "fooDigest") }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      mail.subject.should eq("Cloud Gephi - Password reset")
      mail.to.should eq([user.email])
      mail.from.should eq(["noreply@gephi.org"])
      mail.body.encoded.should match(edit_password_reset_path(user.password_reset_token)) 
    end

  end

end
