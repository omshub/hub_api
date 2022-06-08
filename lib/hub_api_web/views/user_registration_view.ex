defmodule HubApiWeb.UserRegistrationView do
  use HubApiWeb, :view

  def render("register.json", %{:user => user}) do
    %{
      data: render_one(user, HubApiWeb.UserRegistrationView, "privileged_user.json", as: :user)
    }
  end

  def render("privileged_user.json", %{user: user}) do
    %{
      id: user.id,
      email: user.email
    }
  end
end
