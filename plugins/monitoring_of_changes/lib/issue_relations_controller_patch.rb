module IssueRelationsPatches
  module IssueRelationsControllerPatch
    def self.included(base)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :create, :ext
        alias_method_chain :destroy, :ext
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def create_with_ext
        create_without_ext
        ChangeMonitor.send_issue_update(@issue.id,
                                        User.current.id,
                                        DateTime.now .strftime('%Y-%d-%m %H:%M:%S'))
      end

      def destroy_with_ext
        destroy_without_ext
        ChangeMonitor.send_issue_update(@relation.issue_from_id,
                                        User.current.id,
                                        DateTime.now .strftime('%Y-%d-%m %H:%M:%S'))
      end
    end
  end
end
