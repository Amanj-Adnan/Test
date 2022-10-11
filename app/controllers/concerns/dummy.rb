module Dummy
  extend ActiveSupport::Concern
  require "json"


  def get_data
    file = File.read("/Users/macbookshop/RubymineProjects/Test/app/controllers/concerns/dummy.json")
    @data = JSON.load file
  end
end







