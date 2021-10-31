defmodule DocumentConverter.FileConfiguration do
  use Ecto.Schema
  import Ecto.Changeset

  @all_fields [:new, :old, :id, :name, :publish]
  @encode_fields [:breadcrumb | @all_fields]
  @derive {Jason.Encoder, only: @encode_fields}
  @primary_key false
  schema "file_configuration" do
    field :new, :string
    field :old, :string
    field :name, :string
    field :id, :integer
    field :publish, :boolean
    embeds_many :breadcrumb, Breadcrumb do
      @primary_key false
      @derive {Jason.Encoder, only: [:file_id]}
      field :file_id, :integer
    end
  end

  def changeset(config, attrs) do
    config
    |> cast(attrs, @all_fields)
    |> cast_embed(:breadcrumb, with: &breadcrumb_changeset/2)
  end

  def update_changeset(config, attrs) do
    config
    |> cast(attrs, @all_fields)
    |> cast_embed(:breadcrumb, with: &breadcrumb_changeset/2)
  end

  def breadcrumb_changeset(image, attrs) do
    image
    |> cast(attrs, [:file_id])
  end
end
