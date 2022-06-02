defmodule HubApiWeb.UserRegistrationController do
  use HubApiWeb, :controller

  alias HubApi.Accounts
  alias HubApi.Accounts.User
  alias HubApi.Ecto.Errors
  alias HubApiWeb.UserAuth

  def create(conn, %{"user" => user_params}) do
    case Accounts.register_user(user_params) do
      {:ok, user} ->
        Auth.deliver_user_confirmation_instructions(user, fn token -> "#{token}" end)
        # Accounts.deliver_user_confirmation_instructions(
        #   user,
        #   &Routes.user_confirmation_url(conn, :edit, &1)
        # )

        conn
        |> put_status(201)
        |> render("register.json", user: user)

      {:error, %Ecto.Changeset{} = changeset} ->
        errors = Errors.changeset_errors_to_string(changeset)

        conn
        |> put_status(422)
        |> json(errors)
    end
  end
end
