require "application_system_test_case"

class GitReposTest < ApplicationSystemTestCase
  setup do
    @git_repo = git_repos(:one)
  end

  test "visiting the index" do
    visit git_repos_url
    assert_selector "h1", text: "Git Repos"
  end

  test "creating a Git repo" do
    visit git_repos_url
    click_on "New Git Repo"

    fill_in "Email", with: @git_repo.email
    fill_in "Provider", with: @git_repo.provider
    fill_in "Uid", with: @git_repo.uid
    click_on "Create Git repo"

    assert_text "Git repo was successfully created"
    click_on "Back"
  end

  test "updating a Git repo" do
    visit git_repos_url
    click_on "Edit", match: :first

    fill_in "Email", with: @git_repo.email
    fill_in "Provider", with: @git_repo.provider
    fill_in "Uid", with: @git_repo.uid
    click_on "Update Git repo"

    assert_text "Git repo was successfully updated"
    click_on "Back"
  end

  test "destroying a Git repo" do
    visit git_repos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Git repo was successfully destroyed"
  end
end
