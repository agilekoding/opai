module Opai
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      source_root File.expand_path('../templates', __FILE__)

      desc "Generates a complete OPAI scaffold"

      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"

      def default_rails_scaffold
        generate "scaffold", "#{name} #{raw_attributes}"
      end

      def backbone_on_rails_scaffold
        generate "backbone:scaffold", "#{name} #{raw_attributes}"
      end

      private

      def raw_attributes
        @raw_attributes ||= attributes.map{ |a| "#{a.name}:#{a.type}"}.join(' ')
      end
    end
  end
end
