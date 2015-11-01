require 'pry'

# Main instance where the game take place
class World
  attr_reader :state

  def initialize(seed)
    @state = seed
  end

  def tick
    new_state = state.map(&:dup)
    state.each_with_index do |row, y|
      row.each_with_index do |_cell, x|
        living_neighbours = 0
        (-1..1).each do |n_y|
          (-1..1).each do |n_x|
            next if 0 == n_y && 0 == n_x
            next if y + n_y < 0 || x + n_x < 0
            living_neighbours += (state[y + n_y] && state[y + n_y][x + n_x]).to_i
            break if living_neighbours > 3
          end
        end

        if living_neighbours < 2
          new_state[y][x] = 0
        elsif living_neighbours > 3
          new_state[y][x] = 0
        elsif living_neighbours == 3
          new_state[y][x] = 1
        else
          new_state[y][x] = state[y][x]
        end
      end
    end
    @state = new_state
  end
end
