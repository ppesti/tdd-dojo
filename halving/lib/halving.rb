# frozen_string_literal: true

class Node
  attr_accessor :value, :marked

  def initialize(value, marked)
    @value = value
    @marked = marked
  end

  def ==(other)
    other.is_a?(Node) && value == other.value && marked == other.marked
  end

  def to_s
    "Node(value=#{value}, marked={#{marked}})"
  end
end

class Halving
  def self.contains_marked?(arr)
    arr.any?(&:marked)
  end

  def self.node_halving_starter(arr)
    return [] if arr.empty?

    marked_nodes = []

    while marked_nodes.size < 2
      marked_node = find_marked arr
      break unless marked_node

      marked_nodes << marked_node
      arr.delete marked_node
    end

    marked_nodes
  end

  def self.find_marked(arr)
    return nil if arr.empty?

    return arr.first if arr.size == 1 && arr.first.marked

    mid = arr.size / 2
    head = arr[0...mid]
    tail = arr[mid..]

    if contains_marked? head
      find_marked head
    elsif contains_marked? tail
      find_marked tail
    end
  end
end
