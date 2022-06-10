

class Node

    attr_accessor :value, :children

    def initialize(val)
        @value = val
        @children = []
    end

    def parent_of(*nodes)
        @children += nodes
    end

    def no_children?
        return @children.length == 0
    end

    def inspect
        return "Value: #{@value}     Children: #{@children}"
    end

end

n_1 = Node.new(1)
n_2 = Node.new(2)
n_3 = Node.new(3)
n_4 = Node.new(4)
n_5 = Node.new(5)
n_6 = Node.new(6)
n_7 = Node.new(7)

n_1.parent_of(n_2, n_3)
n_2.parent_of(n_4, n_5)
n_3.parent_of(n_6, n_7)


def dfs(node)
    arr = []
    return node.value if node.no_children?
    arr << node.value
    node.children.each do |el|
        arr << dfs(el)
    end
    return arr.flatten
end

puts
puts "Depth First Search"
print dfs(n_1)

def bfs(queue)
    return nil if queue.length == 0
    p queue[0].value
    node = queue.shift
    node.children.each do |child|
        queue << child
        # bfs(child, queue)
    end
    bfs(queue)
end
puts
puts "Breadth First Search"
bfs([n_1])



def bfs2(queue,return_array)
    return return_array if queue.length == 0
    p queue[0].value
    return_array << queue[0].value
    node = queue.shift
    node.children.each do |child|
        queue << child
        # bfs(child, queue)
    end
    bfs2(queue, return_array)
end

puts
puts
p bfs2([n_1],[])