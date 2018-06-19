defmodule Lists do
  def len([]), do: 0
  def len([_hd | tl]), do: 1 + len(tl)

  def double([]), do: []
  def double([hd | tl]) do
    [hd*2 | double(tl)]
  end

  def sum_pairs([hd | []]), do: [hd]
  def sum_pairs([]), do: []
  def sum_pairs([h1, h2 | tl]) do
    [h1+h2 | sum_pairs(tl)]
  end

  def map([], _func), do: []
  def map([hd | tl], func) do
    [func.(hd) | map(tl,func)]
  end
end
