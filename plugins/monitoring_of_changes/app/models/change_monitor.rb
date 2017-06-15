require 'json'

class ChangeMonitor
  include ActiveModel::Model

  def self.send_issue_update(issue, user)
    debugger
    data = {
      'userid' => user,
      'issueid' => issue,
      'datetime' => DateTime.now.strftime('%Y-%d-%m %H:%M:%S')
    }
    HTTParty.post('http://' + callback_url.to_s,query: data)
  end

  private

  def self.callback_url
    Setting.plugin_monitoring_of_changes.values[0]
  end
end
