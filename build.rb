#!/usr/bin/env ruby -wU

SETUP_RUBY_VERSION = "2.6.6"

MAC_OS = %w[intro
  remote_tools
  osx_apple_silicon
  osx_command_line_tools
  github
  homebrew
  osx_sublime_text
  osx_oh_my_zsh
  github_rsa
  gh_cli
  dotfiles
  ssh_osx
  rbenv_osx
  rbenv_ruby
  nvm
  yarn
  osx_postgresql
  osx_security
  checkup
  alumni_platform
  osx_slack
  osx_preferences].freeze

UBUNTU = %w[intro
  remote_tools
  github
  ubuntu_git
  ubuntu_sublime_text
  ubuntu_oh_my_zsh
  github_rsa
  gh_cli
  dotfiles
  rbenv_ubuntu
  rbenv_ruby
  nvm
  yarn
  ubuntu_postgresql
  ubuntu_inotify
  ubuntu_extra
  checkup
  alumni_platform
  ubuntu_slack].freeze

WINDOWS = %w[intro
  wsl2_prereq_intro
  wsl2_prereq_win10
  wsl2_prereq_win_version
  wsl2_prereq_virtualization
  github
  remote_tools
  wsl2_install_wsl
  wsl2_vscode
  wsl2_vscode_settings
  wsl2_windows_terminal
  wsl2_git
  wsl2_oh_my_zsh
  github_rsa
  gh_cli
  wsl2_dotfiles
  wsl_browser_variable
  rbenv_ubuntu
  rbenv_ruby
  nvm
  yarn
  wls_postgresql
  checkup
  wsl_explorer
  alumni_platform
  wls_slack].freeze

filenames = {
  'macOS.md' => MAC_OS,
  'UBUNTU.md' => UBUNTU,
  'WINDOWS.md' => WINDOWS
}

["", "cn"].each do |locale|
  filenames.each do |filename, partials|
    filename = "#{filename.split('.md').first}.#{locale}.md" unless locale.empty?
    File.open(filename, 'w:utf-8') do |f|
      partials.each do |partial|
        folder = locale.empty? ? "_partials" : "_partials/#{locale}"
        f << File.read(File.join(folder, "#{partial}.md"), encoding: "utf-8").gsub("<RUBY_VERSION>", SETUP_RUBY_VERSION)
        f << "\n\n"
      end
    end
  end
end
