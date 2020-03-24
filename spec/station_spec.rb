require './lib/station'

describe Station do
  let(:station) { Station.new("Hammersmith", 1) }
  describe "Name testing" do
    it " should let you know the name of the station" do
      expect(station).to respond_to(:name)
    end
  end
  describe "Zone testing" do
    it " should let you know which zone the station is in" do
      expect(station).to respond_to(:zone)
    end
  end

end
