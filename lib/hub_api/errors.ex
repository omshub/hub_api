defmodule HubApi.Ecto.Errors do
  def changeset_errors_to_string(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", to_string(value))
      end)
    end)
    # |> Enum.reduce("", fn {k, v}, acc ->
    #   IO.inspect(v)
    #   # joined_errors = Enum.join(v, "; ")
    #   # "#{acc}#{k}: #{joined_errors}\\n"
    # end)
  end
end
