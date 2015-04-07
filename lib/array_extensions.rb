module ArrayExtensions
  def pmap
    map do |el|
      Thread.new do
        yield el
      end
    end.map(&:value)
  end
end

class Array
  include ArrayExtensions
end
