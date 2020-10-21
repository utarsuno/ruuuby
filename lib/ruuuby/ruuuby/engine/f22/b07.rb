# encoding: UTF-8

module ::Ruuuby::MetaData
  class RuuubyEngine

    module F22B07

      # @see https://www.lifewire.com/display-hidden-files-in-os-x-153332
      # @see https://osxdaily.com/2012/10/09/best-defaults-write-commands-mac-os-x/
      # @see https://www.lifewire.com/terminal-tricks-to-speed-up-your-mac-4120954
      #
      # applies following changes: (in the order the commands appear in)
      #  - always show hidden files in finder GUI
      #  - hide desktop icons completely (⚠️: this will also disable right-click functionality for the Desktop)
      #  - remove auto-hide delay from the Dock
      #  - shorten the duration of "Mission Control Animations"
      #  - display hidden apps as translucent @ the Dock
      #  - always show user library folder
      #  - disable window animations
      #  - display system info @ the login screen
      def self.apply_preferred_configs(skip_sudo_settings=true)
        the_cmd = '\
defaults write com.apple.finder AppleShowAllFiles -boolean true && \
defaults write com.apple.finder CreateDesktop -bool false && killall Finder && \
defaults write com.apple.dock autohide-delay -float 0 && \
defaults write com.apple.dock expose-animation-duration -float 0.12 && \
defaults write com.apple.dock showhidden -bool YES && killall Dock && \
chflags nohidden ~/Library/ && \
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false'
        the_cmd << ' && sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName' unless skip_sudo_settings
        💻(the_cmd)
      end

    end # end: {F22B07}

    # @return [Ruuuby::MetaData::RuuubyEngine::F22B07]
    def mac; ::Ruuuby::MetaData::RuuubyEngine::F22B07; end

  end
end

# TODO:
#  * https://goinbigdata.com/demystifying-ifconfig-and-network-interfaces-in-linux/
#  * https://linux.die.net/man/8/ifconfig
#  * https://www.computerhope.com/unix/uifconfi.htm
#  * https://www.computerhope.com/jargon/m/multicast.htm
#  * https://www.tecmint.com/ifconfig-command-examples/
#  * https://www.techrepublic.com/blog/apple-in-the-enterprise/diagnose-mac-networking-problems-with-these-three-commands/
#  * https://stackoverflow.com/questions/37860936/find-out-which-network-interface-belongs-to-docker-container
#  * https://unix.stackexchange.com/questions/103241/how-to-use-ifconfig-to-show-active-interface-only
#  * https://stackoverflow.com/questions/50520202/macos-en5-network-cant-be-turned-off
#  * https://en.wikipedia.org/wiki/Subnetwork
#  * https://support.microsoft.com/en-us/help/164015/understanding-tcp-ip-addressing-and-subnetting-basics
