module CatarseMonkeymail
  class Engine < ::Rails::Engine
    isolate_namespace CatarseMonkeymail

    initializer 'include modules' do
      ::ApplicationController.send(:include, CatarseMonkeymail::ControllerConcerns)
    end
  end
end
