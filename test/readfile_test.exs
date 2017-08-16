defmodule ReadfileTest do
  use ExUnit.Case
  doctest Readfile

  test "greets the world" do
    assert Readfile.hello() == :world
  end
end
