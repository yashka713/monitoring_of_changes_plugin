module AttachmentPatches
  module AttachmentPatch
    def self.included(base)
      unloadable
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval {alias_method_chain :delete_from_disk, :ext}
    end

    module ClassMethods
    end

    module InstanceMethods
      def delete_from_disk_with_ext
        delete_from_disk_without_ext
        ChangeMonitor.send_issue_update(
            container_id,
            User.current.id
        )
      end
    end
  end
end
