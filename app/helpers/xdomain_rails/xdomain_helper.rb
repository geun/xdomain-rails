module XdomainRails
  module XdomainHelper
    def xdomain_masters(domains=nil)
      domains = (domains || master_domains).to_json.html_safe
      javascript_include_tag("xdomain") + javascript_tag("xdomain.masters(#{domains})")
    end

    def xdomain_slaves(domains=nil)
      domains = (domains || slave_domains).to_json.html_safe
      javascript_include_tag("xdomain") + javascript_tag("xdomain.slaves(#{domains})")
    end

    private

    def config
      Rails.configuration.xdomain
    end

    def master_domains
      config.master_domains
    end

    def slave_domains
      config.slave_domains
    end
  end
end
