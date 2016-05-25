require 'rails_helper'

describe HomeController do
  render_views

  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end

    # it "gets the correct index view template" do 
    #   get "index"
    #   response.should assert_template("home/index")
    # end
  end

end