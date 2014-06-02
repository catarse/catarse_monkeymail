module CatarseMonkeymail
  class Configuration
    attr_accessor :api_key, :list_id, :successful_projects_list, :failed_projects_list

    def inititalizer
      @api_key = ''
      @list_id = ''
      @successful_projects_list = ''
      @failed_projects_list = ''
    end
  end
end
