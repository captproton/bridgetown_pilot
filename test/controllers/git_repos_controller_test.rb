require "test_helper"

class GitReposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @git_repo = git_repos(:one)
  end

  test "should get index" do
    get git_repos_url
    assert_response :success
  end

  test "should get new" do
    get new_git_repo_url
    assert_response :success
  end

  test "should create git_repo" do
    assert_difference('GitRepo.count') do
      post git_repos_url, params: { git_repo: { email: @git_repo.email, provider: @git_repo.provider, uid: @git_repo.uid } }
    end

    assert_redirected_to git_repo_url(GitRepo.last)
  end

  test "should show git_repo" do
    get git_repo_url(@git_repo)
    assert_response :success
  end

  test "should get edit" do
    get edit_git_repo_url(@git_repo)
    assert_response :success
  end

  test "should update git_repo" do
    patch git_repo_url(@git_repo), params: { git_repo: { email: @git_repo.email, provider: @git_repo.provider, uid: @git_repo.uid } }
    assert_redirected_to git_repo_url(@git_repo)
  end

  test "should destroy git_repo" do
    assert_difference('GitRepo.count', -1) do
      delete git_repo_url(@git_repo)
    end

    assert_redirected_to git_repos_url
  end
end
