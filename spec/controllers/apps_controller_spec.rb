require 'spec_helper'

describe Api::AppsController do
  it 'returns the list of apps' do
    user = create :user_with_apps, :apps_count => 3
    get :index, :format => :json, :user_token => user.user_token, :secret_token => user.secret_token
    puts response.body
    expect(response).to be_success
    expect (json.length).should == 3
  end
end
