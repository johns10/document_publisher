defmodule Mix.Tasks.Publish do
  use Mix.Task
  alias DocumentConverter.Migration
  alias DocumentConverter.FileConfigurations
  def run(args) do
    case args do
      [] -> Migration.publish_all_to_confluence
      [file] ->
        FileConfigurations.get_by_new(file)
        |> Migration.publish_to_confluence()
    end
  end

end
