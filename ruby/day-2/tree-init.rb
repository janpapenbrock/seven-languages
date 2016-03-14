class Tree

  attr_accessor :children, :node_name

  def initialize tree_hash
    @children = []
    @node_name = ""
    tree_hash.each_pair do |name, children|
      @node_name = name

      children.each_pair do |child_name, grandchildren|
        @children << Tree.new({ child_name => grandchildren })
      end
    end
  end

  def visit_all(&block)
    visit &block
    children.each do |child|
      child.visit_all(&block)
    end
  end

  def visit(&block)
    block.call self
  end
end

t = Tree.new({ 'grandpa' => { 'dad' => { 'child1' => {}, 'child2' => {} }, 'uncle' => { 'child3' => {}, 'child4' => {} } } })

t.visit_all { |node| puts node.node_name }
