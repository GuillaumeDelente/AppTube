require 'spec_helper'

describe User do
  it "has a user token and secret token" do
    user = create(:user)
    expect(user.user_token).not_to be_blank
    expect(user.secret_token).not_to be_blank
  end
end
