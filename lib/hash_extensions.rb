module HashExtensions
  def update_in(*keys, &block)
    key = keys.first
    current = fetch(key)
    if keys.length > 1
      keys.shift
      new_val = current.update_in(*keys, &block)
    else
      new_val = yield current
    end
    merge({ key => new_val })
  end

  def select_keys(*keys)
    keys.reduce({}) do |ret, key|
      ret[key] = fetch(key)
      ret
    end
  end

  def without(*keys)
    keys.reduce(dup) do |ret, key|
      ret.delete(key)
      ret
    end
  end
end

class Hash
  include HashExtensions
end
