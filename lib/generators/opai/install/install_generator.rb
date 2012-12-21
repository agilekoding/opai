module Opai
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      desc "Installs the OPAI structure application."

      def mongo_mapper_configuration
        generate "mongo_mapper:config"
      end

      def backbone_on_rails_install
        generate "backbone:install"
      end

      private

      def raw_attributes
        @raw_attributes ||= attributes.map{ |a| "#{a.name}:#{a.type}"}.join(' ')
      end
    end
  end
end
