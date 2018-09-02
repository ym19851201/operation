def reduce(a)
  result = a.inject([]) do |sum, item|
    if sum.empty?
      sum = [item]
#     elsif item =~ /\d+/
    elsif item != '+' and item != '-' and item != '*' and item != '/' 
      ope = sum.pop
      sum = [operate(sum[0], item, ope)]
    else
      next_ope = item
      sum << next_ope
    end
  end
  result.pop
end

def operate(a, b, operator)
  a.send(operator, b)
end

def shrink_brackets(a)
  s_i = a.rindex('(')
  return a unless s_i

  e_i = s_i + a[(s_i+1)..-1].index(')') + 1
  result = shrink_and_calculate(a[(s_i+1)...e_i])
  shrink_brackets(front_bracket(a, s_i) + [result] + back_bracket(a, e_i))
end

def shrink(a)
  md = proc {|e| e == '*' or e == '/'}
  index = a.index &md
  return a unless index

  result = operate(a[index-1], a[index+1], a[index])
  shrink(front(a, index) + [result] + back(a, index))
end

def front_bracket(a, bracket_index)
  a[0...bracket_index]
end

def back_bracket(a, bracket_index)
  a[(bracket_index + 1)..-1]
end

def front(a, index)
  if index - 2 > 0
    front = a[0..(index-2)]
  else
    front = []
  end
end

def back(a, index)
  if index + 2 < a.length - 1
    back = a[(index+2)..-1]
  else
    back = []
  end
end

def calculate(a)
  elements = split_elements(a)
  shrink_and_calculate(elements)
end

def shrink_and_calculate(a)
  reduce(shrink(shrink_brackets(a)))
end

def split_elements(str)
  str.split(/(\(|\))/).map {|e| e.split(' ')}.flatten.map do |e| 
    if e == '*' or e == '/' or e == '+' or e == '-' or e == '(' or e == ')' 
      e
    else
      e.to_i
    end
  end
end
