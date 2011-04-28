require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Set do

  let(:set) { Set.new([1,2,3,4]) }

  describe '#complement' do
    it 'should have a #complement method' do
      set.should respond_to(:complement)
    end

    it 'should not throw an error with a single set as an argument' do
      -> { set.complement(Set.new([3,4,5,6]))}.should_not raise_error
    end

    it 'should not throw an error with a single array as an argument' do
      -> { set.complement([3,4,5,6])}.should_not raise_error
    end

    it 'should not throw an error with a single hash as an argument' do
      -> { set.complement({a: 6, b: 7})}.should_not raise_error
    end

    it 'should throw an error with a single non-enumerable as an argument' do
      -> { set.complement(5)}.should raise_error
    end

    it 'should throw an error with no argument' do
      -> { set.complement()}.should raise_error
    end

    it 'should throw an error with more than one argument' do
      -> { set.complement([5,6,7,8],[9,10,11,12])}.should raise_error
    end

    it 'should return the set from argument enum if sets are disjoint' do
      set.complement([5,6,7,8]).should == Set.new([5,6,7,8])
    end

    it 'should return an empty set if sets are identical' do
      set.complement([1,2,3,4]).should == Set.new
    end

    it 'should return complement of argument set with respect to messaged set if sets intersect' do
      set.complement([3,4,5,6]).should == Set.new([5,6])
    end

  end

  describe '#power_set' do

    it 'should have a #power_set method' do
      set.should respond_to(:power_set)
    end

    it 'should not raise an error with 0 arguments' do
      -> { set.power_set }.should_not raise_error
    end

    it 'should raise an error with more than 0 arugments' do
      -> { set.power_set(1) }.should raise_error
    end

    it 'should return a set containing an empty set if it is already an empty set' do
      empty_set = Set.new
      empty_set.power_set.should == Set.new([Set.new])
    end

    it 'should return the correct power set if it has a single element' do
      small_set = Set.new([1])
      small_set.power_set.should == Set.new([Set.new,Set.new([1])])
    end

    it 'should return the correct power set if it has multiple elements' do
      set.power_set.should == Set.new([
        Set.new,
        Set.new([1]),
        Set.new([2]),
        Set.new([3]),
        Set.new([4]),
        Set.new([1,2]),
        Set.new([1,3]),
        Set.new([1,4]),
        Set.new([2,3]),
        Set.new([2,4]),
        Set.new([3,4]),
        Set.new([1,2,3]),
        Set.new([1,2,4]),
        Set.new([1,3,4]),
        Set.new([2,3,4]),
        Set.new([1,2,3,4]),
      ])
    end

  end

  describe '#cartesian_product' do
    it 'should have a #cartesian_product method' do
      set.should respond_to(:cartesian_product)
    end
  end
end
