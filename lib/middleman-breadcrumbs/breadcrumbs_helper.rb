require 'rack/utils'
require 'padrino-helpers'

module BreadcrumbsHelper
  def self.included(klass)
    klass.send(:include, Padrino::Helpers) unless klass.instance_methods.include? :link_to
  end

  def breadcrumbs(page, separator: ' > ', wrapper: nil)
    hierarchy = [page]
    hierarchy.unshift hierarchy.first.parent while hierarchy.first.parent
    hierarchy.collect {|page| %{<a href="/#{page.path}">#{h page.data.title}</a>} }.join(h separator)
  end

  private

  def wrap(content, wrapper: wrapper)
    wrapper ? content_tag(wrapper) { content } : content
  end
end
