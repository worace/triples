BASE_MATRICES = [
                  [[1, 2, 2], [2, 1, 2], [2, 2, 3]],
                  [[1, -2, 2], [2, -1, 2], [2, -2, 3]],
                  [[-1, 2, 2], [-2, 1, 2], [-2, 2, 3]]
                ]
class TripleTree
  def root
    @root ||= Leaf.new
  end

  def leaves(level = 0, last = root.children, coll = [root])
    if level == 0
      coll
    else
      leaves(level - 1, last.flat_map(&:children), coll + last)
    end
  end

end

class Leaf
  attr_reader :triple
  def initialize(triple = [3,4,5])
    @triple = triple
  end

  def inspect
    to_s
  end

  def to_s
    "Leaf with triple value #{triple}"
  end

  def sum
    triple.reduce(:+)
  end

  def children
    @children ||= BASE_MATRICES.map { |m| Leaf.new(matrix_by_vector(m, triple)) }
  end

  def triple?(triple)
    triple[0]**2 + triple[1]**2 == triple[2]**2
  end

  def matrix_by_vector(matrix, vector)
    matrix.map do |row|
      vector_by_vector(row, vector).reduce(:+)
    end
  end

  def vector_by_vector(v1, v2)
    v1.zip(v2).map { |pair| pair.reduce(:*) }
  end

  def *(n)
    Leaf.new(vector_by_vector(triple, [n,n,n]))
  end
end
