require_dependency 'changes_hook_listener'
require_dependency 'issue_relations_controller_patch'
require_dependency 'issue_patch'
require_dependency 'attachment_patch'

Rails.logger.info 'Starting Updates Checker plugin...'

RedmineApp::Application.routes.draw do
  require_dependency 'issue'
  require_dependency 'issue_relations_controller'
  require_dependency 'attachment'

  IssueRelationsController.send(:include, IssueRelationsPatches::IssueRelationsControllerPatch)
  Attachment.send(:include, AttachmentPatches::AttachmentPatch)
  Issue.send(:include, IssuePatches::IssuePatch)
end

Redmine::Plugin.register :monitoring_of_changes do
  name 'Monitoring Of Changes plugin'
  author 'Liakh Yaroslav'
  description 'This is a plugin for "Redmine" that watch about changes in issues'
  version '0.0.1'

  settings default: { 'empty' => true }, partial: 'settings/url_settings'
end
