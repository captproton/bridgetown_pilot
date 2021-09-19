class GitRepo
    require 'octokit'

    attr_reader :branch, :client, :pages_path, :posts_path, :repo,:repo_path


    def initialize(repo_path:, branch: 'main')
        @branch     = branch
        @client     = Octokit::Client.new :access_token => ENV["OAUTH_ACCESS_TOKEN"]
        @repo_path  = repo_path
        @repo       = @client.repository(repo_path)

        @posts_path = "_posts"
        @pages_path = ""

    end

    def show
        self.repo
    end
# CRUD methods
#   before_action :set_git_repo, only: %i[ show edit update destroy ]


  # GET /git_repos or /git_repos.json
  def list_files(file_path='')
    # @git_repos = GitRepo.all
    key_list = [:name, :path, :sha, :type]
    selected_files = []

    files_and_folders_in_dir = client.contents(repo_path, :path => file_path)
    content_files = files_and_folders_in_dir.select{|file| file[:path].downcase.include?(".md")}
    content_files.each do |file|
      slimmer_content_file = file.select do |key, value|
        key_list.include?(key)
      end
      selected_files << slimmer_content_file.to_h
    end

    selected_files
    
  end


  # GET /git_repos/1 or /git_repos/1.json
  def get_file_content(file_path)
    page          = _get_repo_file_metadata(file_path)
    content       = Base64.decode64(page[:content])

  end

  # GET /git_repos/new
  def new_file

  end

  # GET /git_repos/1/edit
  def edit_file

  end

  # POST /git_repos or /git_repos.json
  def create_file
    # @git_repo = GitRepo.new(git_repo_params)

    # respond_to do |format|
    #   if @git_repo.save
    #     format.html { redirect_to @git_repo, notice: "Git repo was successfully created." }
    #     format.json { render :show, status: :created, location: @git_repo }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @git_repo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /git_repos/1 or /git_repos/1.json
#   def update_file(repo_path, 
#         file_path, 
#         commit_comment="Updating content",
#         branch_name="main",
#         sha,
#         file_content)

        # split_file_path = file_path.split('/')
        # filename        = split_file_path.pop
        # file_dir        = split_file_path
        # [filename, file_dir]
        # sha         = _find_repo_file_and_get_sha(repo_path, file_path, filename)
        # client      = _init_octokit_client

        # client.update_contents(repo_path,
        #                         file_path,
        #                         commit_comment, 
        #                         sha,
        #                         file_content,
        #                         :branch => branch_name)
    
    # respond_to do |format|
    #   if @git_repo.update(git_repo_params)
    #     format.html { redirect_to @git_repo, notice: "Git repo was successfully updated." }
    #     format.json { render :show, status: :ok, location: @git_repo }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @git_repo.errors, status: :unprocessable_entity }
    #   end
    # end
#   end

  # DELETE /git_repos/1 or /git_repos/1.json
#   def destroy_file

#     @git_repo.destroy
#     respond_to do |format|
#       format.html { redirect_to git_repos_url, notice: "Git repo was successfully destroyed." }
#       format.json { head :no_content }
#     end
#   end

    # Use callbacks to share common setup or constraints between actions.
    def set_git_repo_file
      @git_repo = GitRepo.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def git_repo_file_params
    #   params.require(:git_repo).permit(:email, :provider, :uid)
    end

# 


    def _get_repo_file_metadata(file_path)
        # src_files = client.contents("captproton/bridgetown_experiment", :path => 'src')
        files           = client.contents(repo_path, :path => file_path)
        file_metadata   = client.contents(repo_path, 
                                          path: file_path, 
                                          query: {ref: branch}
                                        )
    end
    
end
