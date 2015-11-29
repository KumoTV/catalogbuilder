require 'rails_helper'

RSpec.describe "notifications/new", type: :view do
  before(:each) do
    assign(:notification, Notification.new(
      :topic => "MyString",
      :subject => "MyText",
      :message => ""
    ))
  end

  it "renders new notification form" do
    render

    assert_select "form[action=?][method=?]", notifications_path, "post" do

      assert_select "input#notification_topic[name=?]", "notification[topic]"

      assert_select "textarea#notification_subject[name=?]", "notification[subject]"

      assert_select "input#notification_message[name=?]", "notification[message]"
    end
  end
end
