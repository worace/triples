require "minitest/spec"
require "minitest/autorun"
require_relative "triples"

describe TripleTree do
  before do
    @tree = TripleTree.new
  end

  it "has a root triple of 3,4,5" do
    assert_equal [3,4,5], @tree.root.triple
  end
end

describe Leaf do
  before do
    @leaf = Leaf.new
  end

  it "verifies a triple" do
    assert @leaf.triple?([3,4,5])
  end

  it "multiples a matrix by a column" do
    m1 = [[1,1,1],[2,2,2]]
    assert_equal [6, 12], @leaf.matrix_by_vector(m1, [2,2,2])
    m2 = [[1,2,3],[4,5,6]]
    assert_equal [12, 30], @leaf.matrix_by_vector(m2, [2,2,2])
  end

  it "generates 3 children" do
    assert_equal 3, @leaf.children.count
  end

  it "has a sum" do
    assert_equal 12, @leaf.sum
  end
end
