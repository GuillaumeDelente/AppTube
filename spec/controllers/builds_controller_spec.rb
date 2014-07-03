require 'spec_helper'

describe Api::BuildsController do
  it 'returns the list of builds of an app' do
    app = create :app_with_builds, :builds_count => 3
    user = create :user
    user.apps = [app]
    get :index, :format => :json, :user_token => user.user_token, :secret_token => user.secret_token, :app_id => app.name
    puts response.body
    expect(response).to be_success
    expect (json.length).should == 3
  end
end
