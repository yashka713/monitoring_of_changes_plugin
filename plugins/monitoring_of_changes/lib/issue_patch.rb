module IssuePatches
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval {after_update :monitoring_issue, on: %i[create update]}
    end

    module ClassMethods
    end

    module InstanceMethods
      def monitoring_issue
        ChangeMonitor.send_issue_update(Issue.find(self).id,
                                        User.current.id
        )
      end
    end
  end
end
