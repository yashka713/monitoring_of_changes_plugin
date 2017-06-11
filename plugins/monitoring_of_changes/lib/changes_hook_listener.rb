module ChangesHooks
  class ChangesListener < Redmine::Hook::ViewListener
    unloadable

    def controller_journals_edit_post(context = {})
      ChangeMonitor.send_issue_update(Issue.find(context[:journal]['journalized_id']).id,
                                      User.current.id,
                                      DateTime.now .strftime('%Y-%d-%m %H:%M:%S'))
    end
  end
end
