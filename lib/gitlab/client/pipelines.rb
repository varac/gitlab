class Gitlab::Client
  # Defines methods related to pipelines.
  # @see https://github.com/gitlabhq/gitlabhq/blob/master/doc/api/pipelines.md
  module Pipelines
    # Gets a list of project pipelines.
    #
    # @example
    #   Gitlab.pipelines(5)
    #   Gitlab.pipelines(5, { per_page: 10, page:  2 })
    #
    # @param  [Integer] project The ID of a project.
    # @param  [Hash] options A customizable set of options.
    # @option options [Integer] :page The page number.
    # @option options [Integer] :per_page The number of results per page.
    # @param  [Integer] project The ID of a project.
    # @return [Array<Gitlab::ObjectifiedHash>]
    def pipelines(project, options={})
      get("/projects/#{project}/pipelines", query: options)
    end

    # Gets a single pipeline.
    #
    # @example
    #   Gitlab.pipeline(5, 36)
    #
    # @param  [Integer] project The ID of a project.
    # @param  [Integer] id The ID of a pipeline.
    # @return [Gitlab::ObjectifiedHash]
    def pipeline(project, id)
      get("/projects/#{project}/pipelines/#{id}")
    end

    # Cancels a pipeline.
    #
    # @example
    #   Gitlab.pipeline_cancel(5, 1)
    #
    # @param  [Integer] project The ID of a project.
    # @param  [Integer] id The ID of a pipeline.
    # @return [Gitlab::ObjectifiedHash] The pipelines changes.
    def pipeline_cancel(project, id)
      post("/projects/#{project}/pipelines/#{id}/cancel")
    end

    # Retry a pipeline.
    #
    # @example
    #   Gitlab.pipeline_retry(5, 1)
    #
    # @param  [Integer] project The ID of a project.
    # @param  [Integer] id The ID of a pipeline.
    # @return [Array<Gitlab::ObjectifiedHash>] The pipelines changes.
    def pipeline_retry(project, id)
      post("/projects/#{project}/pipelines/#{id}/retry")
    end

  end
end
