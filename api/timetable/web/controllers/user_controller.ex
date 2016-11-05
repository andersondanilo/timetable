defmodule Timetable.UserController do
  use Timetable.Web, :controller

  alias Timetable.User

  def index(conn, _params) do
    users = Repo.all(User)
    render(conn, data: users)
  end

  def create(conn, %{"data" => data}) do
    attrs = JaSerializer.Params.to_attributes(data)
    changeset = User.changeset(%User{}, attrs)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(:show, data: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    render(conn, data: user)
  end

  def update(conn, %{"id" => id, "data" => data}) do
    attrs = JaSerializer.Params.to_attributes(data)
    user = Repo.get!(User, id)
    changeset = User.changeset(user, attrs)

    case Repo.update(changeset) do
      {:ok, user} ->
        render(conn, :show, data: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(user)

    send_resp(conn, :no_content, "")
  end
end
