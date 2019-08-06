def matched?(a, b)
  (a == '[' && b == ']') || (a == '{' && b == '}') || (a == '(' && b == ')')
end

def balanced?(string)
  stack = Array.new(1)
  cursor = 0

  string.chars.each do |character|
  	if character == '(' || character == '{' || character == '['
  		stack[cursor] = character
      stack.push
      cursor += 1
    end
  	if character == ')' || character == '}' || character == ']'
      cursor -= 1
  		if (!matched?(stack[cursor], character))
  			return false
      end
    end
  end

  !(cursor > 0)
end

puts balanced?(ARGV[0]) if ARGV[0]
