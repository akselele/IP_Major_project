# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     IpProjectAkselele.Repo.insert!(%IpProjectAkselele.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


{:ok, _cs} =
  IpProjectAkselele.UserContext.create_user(%{
    "password" => "t",
    "role" => "User",
    "username" => "user"
  })

{:ok, _cs} =
  IpProjectAkselele.UserContext.create_user(%{
    "password" => "t",
    "role" => "Admin",
    "username" => "admin"
  })

  {:ok, _cs} =
  IpProjectAkselele.ApiContext.create_api(%{
    "name" => "firstKey",
    "key" => "MyFancyHeader:!ZTHFdFzKCI2DCTPe3y4I?"
  },%IpProjectAkselele.UserContext.User{} = IpProjectAkselele.UserContext.get_user(1) )