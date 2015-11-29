require 'rails_helper'

RSpec.describe "notifications/show", type: :view do
  before(:each) do
    @notification = assign(:notification, Notification.create!(
      :topic => "Topic",
      :subject => "MyText",
      :message => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Topic/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
