(variable_declarator
  value: (template_string) @html)

(tagged_template
  tag: (identifier) @css_tag
  (#eq? @css_tag "css")
  template: (template_string) @css)
