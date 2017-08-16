defmodule Readfile do
	def run do
    filename = "top3list.csv"
		{:ok, csv} = File.read(filename)
    lines = String.split(csv, "\r\n")
    
    IO.puts ""
    IO.puts "Filename: " <> filename
    %{ctime: ctime} = File.stat! filename
    datetime = to_string(Ecto.DateTime.from_erl(ctime))
    IO.puts "Created At: " <> String.replace(datetime, "\"", "")
    
    IO.puts ""
    Enum.each lines, fn line -> 
      team_pieces = String.split(line, ",")
      t = %Readfile.Team{name: Enum.at(team_pieces, 0), super_bowl_wins: Enum.at(team_pieces, 1)}
      header = "| Name: " <> t.name <> " |"
      IO.puts "+" <> String.duplicate("-", String.length(header) - 2) <> "+"
      IO.puts header
      ws = String.length(header) - String.length("| Super Bowl Wins: " <> t.super_bowl_wins) - 2
      IO.puts "| Super Bowl Wins: " <> t.super_bowl_wins <> String.duplicate(" ", ws) <> " |"
      IO.puts "+" <> String.duplicate("-", String.length(header) - 2) <> "+"
      IO.puts ""
    end
    
	end
end

Readfile.run