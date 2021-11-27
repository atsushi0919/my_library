class UnionFind
  attr_reader :parent, :size

  def initialize(n)
    @parent = Array.new(n, -1)
    @size = Array.new(n, 1)
  end

  def root(x)
    return x if @parent[x] < 0
    @parent[x] = root(@parent[x])
  end

  def same?(x, y)
    root(x) == root(y)
  end

  def merge(x, y)
    x = root(x)
    y = root(y)
    return if x == y

    x, y = y, x if @size[x] < @size[y]
    @parent[y] = x
    @size[x] += @size[y]
  end
end
