require 'rails_helper'

RSpec.describe "notifications/edit", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :topic => "MyString",
      :subject => "MyText",
      :message => ""
    ))
  end

  it "renders the edit notification form" do
    render

    assert_select "form[action=?][method=?]", notification_path(@notification), "post" do

      assert_select "input#notification_topic[name=?]", "notification[topic]"

      assert_select "textarea#notification_subject[name=?]", "notification[subject]"

      assert_select "input#notification_message[name=?]", "notification[message]"
    end
  end
end
