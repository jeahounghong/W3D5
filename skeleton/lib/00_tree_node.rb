class PolyTreeNode

    attr_accessor :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(value)
        if @parent.class == PolyTreeNode && @parent != value #&& @parent.children.include?(self)
            @parent.children.delete(self)
        end

        @parent = value

        if value != nil
            if !@parent.children.include?(self)
                @parent.add_child(self)
            end
        end
    end

    def add_child(child)
        @children << child
        child.parent=(self)
    end

    def remove_child(value)
        unless @children.include?(value)
            raise ArgumentError.new "OSDHOFOISDF"
        end
        value.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value
        @children.each do |el|
            value = el.dfs(target_value)
            return value if value != nil
        end
        return nil
    end

    def bfs(target_value)
        return self if @value == target_value
        queue = [self]
        while queue.length > 0 
            queue[0].children.each do |el|
                queue << el
            end
            check = queue.shift
            return check if check.value == target_value
        end
    end

    def inspect
        return [@parent, @value, @children]
    end
end

