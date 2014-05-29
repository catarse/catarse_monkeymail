module CatarseMonkeymail
  class Engine < ::Rails::Engine
    isolate_namespace CatarseMonkeymail

    initializer 'include modules' do
      ::ApplicationController.send(:include, CatarseMonkeymail::ControllerConcerns)
      ::User.send(:include, CatarseMonkeymail::UserConcern)
    end
  end
end
