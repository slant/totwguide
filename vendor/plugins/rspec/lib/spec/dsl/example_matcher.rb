module Spec
  module DSL
    class ExampleMatcher

      attr_writer :example_desc
      def initialize(context_desc, example_desc=nil)
        @context_desc = context_desc
        @example_desc = example_desc
      end
      
      def matches?(specified_examples)
        specified_examples.each do |specified_example|
          return true if specified_example =~ /(^#{context_regexp} #{example_regexp}$|^#{context_regexp}$|^#{example_regexp}$)/
        end
        false
      end
      
      private
        def context_regexp
          Regexp.escape(@context_desc.split('::').last)
        end
        
        def example_regexp
          Regexp.escape(@example_desc)
        end
    end
  end
end
