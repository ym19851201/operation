require 'spec_helper'
require 'calc'

describe 'shrink' do
  it 'shrinks array' do
    array = '1 + 3 - 2 * 3 / 1 + 5'.split(' ')
#     expect(split(array)).to eq ['1', '+', '3', '-', ['2', '*', '3', '/', '1'], '+', '5']
    expect(shrink(array)).to eq ['1', '+', '3', '-', '6', '+', '5']
  end

  it 'shrinks array' do
    array = '1 + 3 - 2 * 3 / 1 + 5 * 8 + 6'.split(' ')
    expect(shrink(array)).to eq ['1', '+', '3', '-', '6', '+', '40', '+', '6']
  end

  it 'shrinks array' do
    array = '1 + 3 - 2 + 6'.split(' ')
    expect(shrink(array)).to eq array
  end

  it 'shrinks array' do
    array = '2 * 3'.split(' ')
    expect(shrink(array)).to eq ['6']
  end
end

describe 'calculate' do
  it 'solves 2 * 3' do
    array = '2 * 3'.split(' ')
    expect(calculate(array)).to eq 6
  end

  it 'solves 2 * 3 + 2' do
    array = '2 * 3 + 2'.split(' ')
    expect(calculate(array)).to eq 8
  end

  it 'solves 2 * 3 - 2' do
    array = '2 * 3 - 2'.split(' ')
    expect(calculate(array)).to eq 4
  end

  it 'solves calculation' do
    array = '1 + 3 * 2'.split(' ')
    expect(calculate(array)).to eq 7
  end

  it 'solves calculation' do
    str =  '1 + 3 * 2 / 6 - 3 * 8 / 4 - 9'
    array = str.split(' ')
    expect(calculate(array)).to eq eval(str)
  end
end

describe 'shrink_brackets' do
  it 'solves' do
    str =  '( 1 + 3 ) * 2 / ( 6 - 3 ) * 8 / 4 - 9'
    array = str.split(' ')
    expect(calculate(array)).to eq eval(str)
  end

  it 'solves' do
    str =  '( 1 + 3 * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    array = str.split(' ')
    expect(calculate(array)).to eq eval(str)
  end

  it 'solves' do
    str =  '5 - ( 1 + 3 * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    array = str.split(' ')
    expect(calculate(array)).to eq eval(str)
  end

  it 'solves' do
    str =  '5 - ( ( 1 + 3 ) * 2 ) * 2 / ( 6 / 3 - 3 ) * 8 / 4 - 9'
    array = str.split(' ')
    expect(calculate(array)).to eq eval(str)
  end
end
