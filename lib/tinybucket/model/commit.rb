module Tinybucket
  module Model
    class Commit < Base
      attr_accessor \
        :hash, :links, :repository, :author, :parents, :date,
        :message, :participants

      attr_accessor :repository

      def comments(options = {})
        comments_api(options).list(options)
      end

      def comment(comment_id, options = {})
        comments_api(options).find(comment_id, options)
      end

      private

      def comments_api(options)
        return @comments if @comments.present?

        fail ArgumentError, 'This method call require repository.' \
          if repository.nil?

        @comments = create_instance 'CommitComments', options
        @comments.repo_owner = repository.repo_owner
        @comments.repo_slug = repository.repo_slug
        @comments.commit = self

        @comments
      end
    end
  end
end