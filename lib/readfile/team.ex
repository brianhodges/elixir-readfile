defmodule Readfile.Team do
	defstruct name: "", super_bowl_wins: nil

	def set_name(t, name) do
	  %{t | name: name}
	end
	
	def set_wins(t, wins) do
	  %{t | super_bowl_wins: wins}
	end
end