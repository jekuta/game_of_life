require 'minitest/autorun'
require 'world'

describe World do
  before do
    @empty_world = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
  end

  describe 'where only one cell lives' do
    before do
      @world = World.new([[0, 0, 0], [0, 1, 0], [0, 0, 0]])
    end

    it 'has no living cells left after first steps' do
      @world.step
      @world.state.must_equal(@empty_world)
    end
  end

  describe 'where two cells are living' do
    before do
      @world = World.new([[0, 1, 0], [0, 1, 0], [0, 0, 0]])
    end

    it 'has no living cells left after first steps' do
      @world.step
      @world.state.must_equal(@empty_world)
    end
  end

  describe 'block' do
    before do
      @seed =
        [
          [1, 1, 0],
          [1, 1, 0],
          [0, 0, 0]
        ]
      @world = World.new(@seed)
    end

    it 'does not change' do
      @world.step
      @world.state.must_equal(@seed)
    end
  end

  describe 'beehive' do
    before do
      @seed =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @world = World.new(@seed)
    end

    it 'does not change' do
      @world.step
      @world.state.must_equal(@seed)
    end
  end

  describe 'toad' do
    before do
      @seed =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 1, 0],
          [0, 1, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @result =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 1, 0, 0, 1, 0],
          [0, 1, 0, 0, 1, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @world = World.new(@seed)
    end

    it 'oscillates' do
      @world.step
      @world.state.must_equal(@result)
    end
  end

  describe 'blinker pattern' do
    before do
      @seed =
        [
          [0, 1, 0],
          [0, 1, 0],
          [0, 1, 0]
        ]
      @result =
        [
          [0, 0, 0],
          [1, 1, 1],
          [0, 0, 0]
        ]
      @world = World.new(@seed)
    end

    it 'oscillates' do
      @world.step
      @world.state.must_equal(@result)
    end
  end

  describe 'glider' do
    before do
      @seed =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 1, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @step1 =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 1, 0, 1, 0, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @step2 =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 1, 0, 1, 0, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @step3 =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0],
          [0, 0, 0, 1, 1, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0]
        ]
      @step4 =
        [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 1, 0],
          [0, 0, 1, 1, 1, 0],
          [0, 0, 0, 0, 0, 0]
        ]

      @world = World.new(@seed)
    end

    it 'travels' do
      @world.step
      @world.state.must_equal(@step1)
      @world.step
      @world.state.must_equal(@step2)
      @world.step
      @world.state.must_equal(@step3)
      @world.step
      @world.state.must_equal(@step4)
    end
  end
end
