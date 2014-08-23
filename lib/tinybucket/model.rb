module Tinybucket
  module Model
    extend ActiveSupport::Autoload

    [
      :Account,
      :Base,
      :BranchRestriction,
      :Commit,
      :CommitComment,
      :ErrorResponse,
      :Page,
      :Profile,
      :PullRequest,
      :Repository,
      :Team
    ].each do |klass_name|
      autoload klass_name
    end
  end
end