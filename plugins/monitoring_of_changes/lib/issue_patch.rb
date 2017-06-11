module IssuePatches
  module IssuePatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        after_update :monitoring_issue, on: %i[create update]
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def monitoring_issue
        ChangeMonitor.send_issue_update(Issue.find(self).id,
                                        User.current.id,
                                        DateTime.now .strftime('%Y-%d-%m %H:%M:%S'))
      end
    end
  end
end
