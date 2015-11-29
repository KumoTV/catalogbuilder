require 'rails_helper'

RSpec.describe "notifications/index", type: :view do
  before(:each) do
    assign(:notifications, [
      Notification.create!(
        :topic => "Topic",
        :subject => "MyText",
        :message => ""
      ),
      Notification.create!(
        :topic => "Topic",
        :subject => "MyText",
        :message => ""
      )
    ])
  end

  it "renders a list of notifications" do
    render
    assert_select "tr>td", :text => "Topic".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
