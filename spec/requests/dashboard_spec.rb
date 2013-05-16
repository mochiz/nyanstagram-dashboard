require "spec_helper"

describe "Dashboard" do

  it "show default page" do
    get "/"
    expect(response).to render_template(:new)
  end

end
