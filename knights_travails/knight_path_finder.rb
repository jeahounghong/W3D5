
class KnightPathFinder

    def initialize(init_pos)
        @init_pos = init_pos
        @root_node = PolyTreeNode.new(@init_pos)
        @considered_positions = [@init_pos]
        
    end

    def build_move_tree
        
        queue = [@root_node]
        nmp = self.new_move_positions(@root_node.value)
        nmp.each {|el| queue << PolyTreeNode.new(el)}
        while queue.length > 0 || check.value do
            check = queue.shift
        end

    end

    def new_move_positions(pos)
        potential_positions = KnightPathFinder(pos)
        potential_positions.each do |el|
            potential_positions.delete(el) if @considered_positions.include?(el)
        end
        @considered_positions += potential_positions
        return potential_positions
    end

    def self.valid_moves(pos)
        @Vector_sums = [
            [1,2],
            [1,-2],
            [2,1],
            [2,-1],
            [-1,2],
            [-1,-2],
            [-2,1],
            [-2,-1]
        ]
        potential_positions = []
        @Vector_sums.each do |el|
            row = pos[0] + el[0]
            col = pos[1] + el[1]
            potential_positions << [row,col] if (0..7).include?(row) && (0..7).include?(col) 
        end
        potential_positions
    end
end

p KnightPathFinder.possible_moves([1,1])