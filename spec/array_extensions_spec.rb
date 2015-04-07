require "rspec"
require "array_extensions"

describe ArrayExtensions do
  context "#pmap" do
    it "maps returns a new collection mapped in parallel" do
      array = [1, 2, 3, 4, 5]
      time = Time.now
      new_array = array.pmap { |x| sleep 1; x + 1 }

      expect(Time.now - time).to be < 5
      expect(new_array).to eq([2, 3, 4, 5, 6])
    end
  end
end
