require "rails_helper"

RSpec.describe BooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/books").to route_to("books#index")
    end

    it "routes to #new" do
      expect(get: "/books/new").to route_to("books#new")
    end

    it "routes to #create" do
      expect(post: "/books").to route_to("books#create")
    end

    it "routes to #show" do
      expect(get: "/books/1").to route_to("books#show", id: "1")
    end
  end
end
