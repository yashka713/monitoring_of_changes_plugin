require 'json'

class ChangeMonitor
  include ActiveModel::Model

  def self.send_issue_update(issue, user, datetime)
    data = {
      'userid' => user,
      'issueid' => issue,
      'datetime' => datetime
    }
    post_to_server(data)
  end

  private

  def self.callback_url
    Setting.plugin_monitoring_of_changes["'callback_url'"]
  end

  def self.post_to_server(data)
    HTTParty.post('http://' + callback_url.to_s,
                  query: data)
  end
end
