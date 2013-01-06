
class UserAgent
  module Browsers
    module Titanium
      def self.extend?(agent)
        agent.detect { |useragent| useragent.product =~ /Titanium/ }
      end

      def browser
        'Titanium'
      end

      def build
        webkit.version
      end

      def mobile?
        true
      end

      def platform
        if application.nil?
          nil
        elsif application.comment[0] =~ /Symbian/
          'Symbian'
        elsif application.comment[0] =~ /webOS/
          'webOS'
        elsif application.comment[0] =~ /Windows/
          'Windows'
        elsif application.comment[0] == 'BB10'
          'BlackBerry'
        else
          application.comment[0].split('/')[0]
        end
      end

      def os
        if platform == 'webOS'
          "Palm #{last.product} #{last.version}"
        elsif platform == 'Symbian'
          application.comment[0]
        elsif application
          if application.comment[0] =~ /Windows NT/
            OperatingSystems.normalize_os(application.comment[0])
          else
            OperatingSystems.normalize_os(application.comment[1])
          end
        else
          nil
        end
      end

      def localization
        if application.nil?
          nil
        else
          application.comment[2]
        end
      end
    end
  end
end
