module Opai
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc "Installs the OPAI structure application."

      def opai
      end

      private

      def raw_attributes
        @raw_attributes ||= attributes.map{ |a| "#{a.name}:#{a.type}"}.join(' ')
      end
    end
  end
end
