defmodule DocumentConverterTest do
  use ExUnit.Case
  doctest DocumentConverter

  alias DocumentConverter.Helpers
  alias DocumentConverter.Parser

  test "extract_extension extracts name and extension" do
    assert Helpers.extract_extension("test_file-name.md") == ["test_file-name", "md"]
    assert Helpers.extract_extension("test_file.name.md") == ["test_file.name", "md"]
  end

  test "extract_id extracts name and id" do
    assert Helpers.extract_id("test-file-name_12345") == ["test-file-name", "12345"]
    assert Helpers.extract_id("test_file.name_12345") == ["test_file.name", "12345"]
  end

  test "extract_images returns list of image tags" do
    markdown = """
    Heading
    -------

    Text

    ![788660225](images/788660225.png "788660225")

    Text
    """

    images =
      Parser.parse(markdown)
      |> Parser.get_tags("img")
    assert images == [{"img",[{"src", "images/788660225.png"},{"alt", "788660225"},{"title", "788660225"}], [], %{}}]
  end
end
