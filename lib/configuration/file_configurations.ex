defmodule DocumentConverter.FileConfigurations do
  require Logger
  alias DocumentConverter.FileConfiguration
  @path Application.get_env(:document_converter, :files_config_path)

  def list() do
    {:ok, config_string} = File.read(@path)
    config =
      case Jason.decode(config_string) do
        {:ok, config} -> config
        {:error, %Jason.DecodeError{data: "", position: 0, token: nil}} -> []
      end
    Enum.map(config, fn(inner_config) -> create_struct(inner_config) end)
  end

  def get_by_new(name) do
    list()
    |> Enum.filter(fn(config) -> config.new == name end)
    |> Enum.at(0)
  end

  def get(id) do
    list()
    |> Enum.filter(fn(config) -> config.id == id end)
    |> Enum.at(0)
  end

  def create_struct(attrs) do
    {:ok, config} =
      FileConfiguration.changeset(%FileConfiguration{}, attrs)
      |> Ecto.Changeset.apply_action(:insert)
    config
  end
end
