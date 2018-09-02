require 'spec_helper'
require 'calc'

describe 'shrink' do
  it 'shrinks array' do
    str = '1 + 3 - 2 * 3 / 1 + 5'
    array = split_elements(str)
    expect(shrink(array)).to eq [1, '+', 3, '-', 6, '+', 5]
  end

  it 'shrinks array' do
    str = '1 + 3 - 2 * 3 / 1 + 5 * 8 + 6'
    array = split_elements(str)
    expect(shrink(array)).to eq [1, '+', 3, '-', 6, '+', 40, '+', 6]
  end

  it 'shrinks array' do
    str = '1 + 3 - 2 + 6'
    array = split_elements(str)
    expect(shrink(array)).to eq [1, '+', 3, '-', 2, '+', 6]
  end

  it 'shrinks array' do
    str = '2 * 3'
    array = split_elements(str)
    expect(shrink(array)).to eq [6]
  end
end

describe 'calculate' do
  it 'solves 2 * 3' do
    str = '2 * 3'
    expect(calculate(str)).to eq 6
  end

  it 'solves 2 * 3 + 2' do
    str = '2 * 3 + 2'
    expect(calculate(str)).to eq 8
  end

  it 'solves 2 * 3 - 2' do
    str = '2 * 3 - 2'
    expect(calculate(str)).to eq 4
  end

  it 'solves calculation' do
    str = '1 + 3 * 2'
    expect(calculate(str)).to eq 7
  end

  it 'solves calculation' do
    str =  '1 + 3 * 2 / 6 - 3 * 8 / 4 - 9'
    expect(calculate(str)).to eq eval(str)
  end

  it 'solves' do
    str =  '( 1 + 3 ) * 2 / ( 6 - 3 ) * 8 / 4 - 9'
    expect(calculate(str)).to eq eval(str)
  end

  it 'solves' do
    str =  '( 1 + 3 * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    expect(calculate(str)).to eq eval(str)
  end

  it 'solves' do
    str =  '5 - ( 1 + 3 * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    expect(calculate(str)).to eq eval(str)
  end

  it 'solves' do
    str =  '5 - ( ( 1 + 3 ) * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    expect(calculate(str)).to eq eval(str)
  end

  it 'solves' do
    str =  '( ( 3 + 2 ) + ( 5 + 4 ) )'
    expect(calculate(str)).to eq eval(str)
  end
end

describe 'split_elements' do
  it 'splits string into elements' do
    str =  '5 - ( ( 1 + 3 ) * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    expect(split_elements(str)).to eq [5, '-', '(', '(', 1, '+', 3, ')', '*', 2, ')', '*', 2, '/', '(', 6, '/', 3, '-', 3, ')', '*', 8, '/', 4, '-', 9]
  end

  it 'splits string into elements' do
    str =  '5 - ((1 + 3) * 2) * 2 / (6 / 3 - 3) * 8 / 4 - 9'
    expect(split_elements(str)).to eq [5, '-', '(', '(', 1, '+', 3, ')', '*', 2, ')', '*', 2, '/', '(', 6, '/', 3, '-', 3, ')', '*', 8, '/', 4, '-', 9]
  end
end
