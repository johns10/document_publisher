defmodule DocumentConverter.Migration do
  require Logger
  alias DocumentConverter.Helpers
  alias DocumentConverter.FileConfigurations

  @dest_path Application.get_env(:document_converter, :dest_path)

  def publish_all_to_confluence() do
    images_path =
      @dest_path
      |> Path.join("images")

    build_images_path =
      @dest_path
      |> Path.join("build")
      |> Path.join("confluence")
      |> Path.join("images")

    File.cp_r(images_path, build_images_path)

    FileConfigurations.list()
    |> Enum.slice(1..20000)
    |> Enum.map(fn(file) ->
      publish_to_confluence(file)
    end)
  end

  def publish_to_confluence(file) do
    space = "FCKB"
    title = file.name
    parent_name =
      Enum.at(file.breadcrumb, -1)
      |> Map.get(:file_id)
      |> FileConfigurations.get()
      |> Map.get(:name)

    {:ok, markdown} =
      Path.join(@dest_path, file.new)
      |> File.read()

    attachments_string =
      markdown
      |> Helpers.fetch_image_tags()
      |> Enum.map(fn([tag, path | _]) ->
        "<!-- Attachment: #{path} -->"
      end)
      |> Enum.join("\n")

    build_path =
      @dest_path
      |> Path.join("build")
      |> Path.join("confluence")
      |> Path.join(file.new)

    front_matter =
      """
      <!-- Space: #{space} -->
      <!-- Title: #{title} -->
      <!-- Parent: #{parent_name} -->
      #{attachments_string}
      """
      |> String.replace("\r\n", "\n")

    File.write(build_path, front_matter <> markdown)
    case file.publish do
      true ->
        IO.inspect("Publish #{file.new}")
        File.cd(@dest_path |> Path.join("build") |> Path.join("confluence"))
        System.cmd("mark", [
          "-c", "C:\\Users\\johnd\\OneDrive\\Documents\\GitHub\\funneldocs\\mark",
          "-f", "#{build_path}"
        ])
      false -> IO.inspect("Don't publish")
      nil -> IO.inspect("Don't publish")
    end
  end
end
