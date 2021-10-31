defmodule DocumentConverter.Helpers do
  def fetch_image_tags(content) do
    ~r/!\[[^\]]*\]\((?<filename>.*?)(?=\"|\))(?<optionalpart>\".*\")?\)/
    |> Regex.scan(content)
  end
end
