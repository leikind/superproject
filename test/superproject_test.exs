defmodule SuperprojectTest do
  use ExUnit.Case

  test "greets the world" do
    assert Superproject.hello() == :world
  end

  test "love is not hate" do
    refute "love" == "hate"
  end

  test "2+2=4" do
    assert 2 + 2 == 4
  end
end
