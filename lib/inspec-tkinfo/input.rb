module InspecPlugins
  module TKInfo
    class Input < Inspec.plugin(2, :input)

      # ========================================================================
      # Dependency Injection

      attr_writer :kitchen_instance

      def kitchen_instance
        require "binding_of_caller"

        @kitchen_instance ||= binding.callers.find { |b| b.frame_description == "verify_action" }.receiver
      end

      # ========================================================================
      # Input Plugin API

      # Fetch method used for Input plugins
      def fetch(_profile_name, input)
        return nil unless valid_plugin_input?(input)

        raise "Plugin can only be run via TestKitchen" unless inside_testkitchen?

        case input
        when "KITCHEN_INSTANCE_NAME"
          kitchen_instance.name
        when "KITCHEN_SUITE_NAME"
          kitchen_instance.suite.name
        when "KITCHEN_PLATFORM_NAME"
          kitchen_instance.platform.name
        end
      end

      private

      # ========================================================================
      # Helper Methods

      # Verify if input is valid for this plugin
      def valid_plugin_input?(input)
        %w{
          KITCHEN_INSTANCE_NAME
          KITCHEN_SUITE_NAME
          KITCHEN_PLATFORM_NAME
        }.include? input
      end

      # Check if this is called from within TestKitchen
      def inside_testkitchen?
        !! defined?(::Kitchen)
      end
    end
  end
end
