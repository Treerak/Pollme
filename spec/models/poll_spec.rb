require "rails_helper"

RSpec.describe Poll, :type => :model do
	it "Can create" do
		Poll.make!
		#Poll.stub(:find) {Poll.new(name: "my first poll")}
		expect{ Poll.find(100)}.to_not raise_error
	end 
end