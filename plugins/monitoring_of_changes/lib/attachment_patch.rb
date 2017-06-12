module AttachmentPatches
  module AttachmentPatch
    def self.included(base)
      unloadable
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :delete_from_disk, :ext
      end
    end

    module ClassMethods
    end

    module InstanceMethods
      def delete_from_disk_with_ext
        delete_from_disk_without_ext
        ChangeMonitor.send_issue_update(container_id,
                                        User.current.id,
                                        DateTime.now.strftime('%Y-%d-%m %H:%M:%S'))
      end
    end
  end
end
