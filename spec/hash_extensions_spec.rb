require "rspec"
require "hash_extensions"

describe HashExtensions do
  context "#update_in" do
    it "returns a new hash with the updated value" do
      hash = { one: 1, two: 2 }
      new_hash = hash.update_in(:two) { |x| x + 1 }
      expect(new_hash).to eq({ one: 1, two: 3 })
    end

    it "returns a new hash with two nested keys updated" do
      hash = { one: 1, two: 2, three: { four: 4, five: 5 } }
      new_hash = hash.update_in(:three, :five) { |x| x + 1 }

      expect(new_hash).to eq({ one: 1, two: 2, three: { four: 4, five: 6 }})
    end

    it "returns a new hash with lots of nested keys updated" do
      hash = {
        one: 1,
        two: 2,
        three: {
          four: 4,
          five: {
            colors: ["red", "blue"]
          }
        }
      }

      new_hash = hash.update_in(:three, :five, :colors) { |colors| colors << "green" }

      expect(new_hash).to eq({
        one: 1,
        two: 2,
        three: {
          four: 4,
          five: {
            colors: ["red", "blue", "green"]
          }
        }
      })
    end
  end

  context "#select_keys" do
    it "returns the provided keys and values from the hash" do
      hash = { a: "A", b: "B", c: "C", d: "C" }
      selected = hash.select_keys(:a, :c)

      expect(selected).to eq({ a: "A", c: "C" })
    end
  end

  context "#without" do
    it "returns a new hash with the provided keys removed" do
      hash = { a: "A", b: "B", c: "C", d: "C" }
      selected = hash.without(:b, :d)

      expect(selected).to eq({ a: "A", c: "C" })
    end
  end
end
