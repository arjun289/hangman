defmodule Fibonacci do
  use Agent
  
  def start_link do
    Agent.start_link(fn -> %{ 0 => 0, 1 => 1} end)
  end

  def fib(n, pid) do
  	state = Agent.get(pid, fn state -> state end)
  	if is_nil(state[n]) do
  		first = fib(n-1, pid)
  		second = fib(n-2, pid)
  		term = first + second
  		Agent.update(pid, fn state -> Map.put(state, n, term) end)
  		term
		else
			state[n]
  	end
  end
end
