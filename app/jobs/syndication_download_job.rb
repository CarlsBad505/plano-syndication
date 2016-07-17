class SyndicationDownloadJob < ActiveJob::Base
  queue_as :default

  def perform(syn)
    syn.send_text_file
  end
end
