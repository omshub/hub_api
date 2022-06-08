defmodule HubApiWeb.UserSessionController do
  use HubApiWeb, :controller

  alias HubApi.Accounts
  alias HubApiWeb.UserAuth

  def create(conn, %{"user" => user_params}) do
    %{"email" => email, "password" => password} = user_params

    if user = Accounts.get_user_by_email_and_password(email, password) do
      UserAuth.log_in_user(conn, user, user_params)
    else
      # In order to prevent user enumeration attacks, don't disclose whether the email is registered.
      conn
        |> put_status(401)
        |> json("Invalid email or password")
    end
  end

  def delete(conn, _params) do
    conn
    |> UserAuth.log_out_user()
    |> json("success")
  end
end
