FISH_ARRAY = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# O(n^2) quadratic
def sluggish_octopus(fishes)
  fishes.each_with_index do |fish1, i1|
    max_length = true

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length >fish1.max_length
    end

    return fish1 if max_length
  end

end

#dominant_octopus
# O(n log n)
class Array
  def merege_sort(&prc)
    prc ||= { |a,b| a <=> b }
    return self if self.length < 2

    midpoint = count / 2
    left = self.take(midpoint).merege_sort(&prc)
    right = self.drop(midpoint).merege_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end
end

#clever octopus
#O(n) linear search
def linear_biggest_fish(fishes)
  #hold the biggest fish
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      #update the biggest fish
      biggest_fish = fish
    end
  end

  biggest_fish

end

  
