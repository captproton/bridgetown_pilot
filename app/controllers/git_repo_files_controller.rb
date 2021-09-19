class GitRepoFilesController < ApplicationController
  before_action :set_git_repo, only: %i[ show edit update destroy ]

  # GET /git_repos or /git_repos.json
  def index
    @git_repo = GitRepo.new(repo_path: "captproton/bridgetown_experiment")
    @git_repo_files = @git_repo.list_files('src')
  end

  # GET /git_repos/1 or /git_repos/1.json
  def show
  end

  # GET /git_repos/new
  def new
    @git_repo = GitRepo.new(repo_path: "captproton/bridgetown_experiment")
  end

  # GET /git_repos/1/edit
  def edit
  end

  # POST /git_repos or /git_repos.json
  def create
    @git_repo = GitRepo.new(git_repo_params)

    respond_to do |format|
      if @git_repo.save
        format.html { redirect_to @git_repo, notice: "Git repo was successfully created." }
        format.json { render :show, status: :created, location: @git_repo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @git_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /git_repos/1 or /git_repos/1.json
  def update
    respond_to do |format|
      if @git_repo.update(git_repo_params)
        format.html { redirect_to @git_repo, notice: "Git repo was successfully updated." }
        format.json { render :show, status: :ok, location: @git_repo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @git_repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /git_repos/1 or /git_repos/1.json
  def destroy
    @git_repo.destroy
    respond_to do |format|
      format.html { redirect_to git_repos_url, notice: "Git repo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_git_repo
      @repo_path              = params[:git_repo]
      @file_path              = "#{params[:id]}.#{params[:format]}"
      @git_repo               = GitRepo.new(repo_path: @repo_path)
      @git_repo_file_contents = @git_repo.get_file_content(@file_path)
    end

    # Only allow a list of trusted parameters through.
    def git_repo_params
      params.require(:git_repo).permit(:email, :provider, :uid)
    end
end
